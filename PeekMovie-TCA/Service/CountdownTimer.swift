//
//  Created by Roman Nabiullin
//
//  Copyright (c) 2023 - Present
//
//  All Rights Reserved.
//

import ComposableArchitecture
import Foundation

// MARK: - Reducer

public struct CountdownTimer: Reducer {

    // MARK: Private properties

    @Dependency(\.continuousClock) private var clock

    // MARK: Cancel ID

    private enum CancelID: Hashable {
        case timer
    }

    // MARK: Init

    public init() {

    }

    // MARK: Body

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .delegate:
                return .none

            case .pause:
                state.isPaused = true
                return .cancel(id: CancelID.timer)

            case .reset:
                state.reset()
                return .none

            case .resume:
                let millisecondsForTick: UInt64 = UInt64(1000 * state.timeIntervalForTick)
                state.isPaused = false
                return .run { send in
                    while !Task.isCancelled {
                        do {
                            try await clock.sleep(for: .milliseconds(millisecondsForTick))
                            await send(._private(.tick))
                        } catch {

                        }
                    }
                }
                .cancellable(id: CancelID.timer, cancelInFlight: true)

            case ._private(.tick):
                state.tick()
                if state.isExpired {
                    return .cancel(id: CancelID.timer).concatenate(
                        with: .send(.delegate(.didExpire))
                    )
                } else {
                    return .none
                }
            }
        }
    }

}

// MARK: - Action

extension CountdownTimer {

    public enum Action: Equatable, Sendable {

        // MARK: Case

        case delegate(Delegate)

        case pause

        case reset

        case resume

        case _private(Private)

    }

}

// MARK: Action: delegate

extension CountdownTimer.Action {

    public enum Delegate: Equatable, Sendable {

        // MARK: Case

        case didExpire

        case didTick

    }

}

// MARK: Action: private

extension CountdownTimer.Action {

    public enum Private: Equatable, Sendable {

        // MARK: Case

        case tick

    }

}

// MARK: - State

extension CountdownTimer {

    public struct State: Equatable, Sendable {

        // MARK: Exposed properties

        public var isExpired: Bool {
            return remainingTicks <= .zero
        }

        public var isPaused: Bool

        public var remainingTicks: UInt

        public var remainingTime: TimeInterval {
            get {
                return TimeInterval(remainingTicks) * timeIntervalForTick
            }
            set {
                remainingTicks = UInt((newValue / timeIntervalForTick).rounded(.up))
            }
        }

        public let timeIntervalForTick: TimeInterval

        public let totalTicks: UInt

        // MARK: Init

        public init(
            totalTicks: UInt,
            timeIntervalForTick: TimeInterval = 1.0
        ) {
            self.isPaused = true
            self.totalTicks = totalTicks
            self.remainingTicks = totalTicks
            self.timeIntervalForTick = timeIntervalForTick
        }

        // MARK: Exposed methods

        public mutating func reset() {
            remainingTicks = totalTicks
        }

        public mutating func tick() {
            remainingTicks = remainingTicks - 1
        }

    }

}
