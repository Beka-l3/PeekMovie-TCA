//
//  Splash.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import ComposableArchitecture

public struct Splash: Reducer {
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
                
            case .delegate:
                return .none
                
            case .timer(.delegate(.didExpire)):
                return .send(.delegate(.shouldClose))
                
            case .timer:
                return .none
                
            case .view(.didAppearFirstTime):
                return .send(._private(.resumeCountdown))
                
            case ._private(.resumeCountdown):
                return .send(.timer(.resume))
                
            case ._private(.pauseCountdown):
                return .send(.timer(.pause))
            }
        }
    }
}

// MARK: - Action
extension Splash {
    
    public enum Action: Equatable, Sendable {
        
        case delegate(Delegate)
        case timer(CountdownTimer.Action)
        case view(View)
        case _private(Private)
    }
    
}

extension Splash.Action {
    
    public enum Delegate: Equatable, Sendable {
        
        case shouldClose
        
    }
    
}

extension Splash.Action {

    public enum View: Equatable, Sendable {

        case didAppearFirstTime

    }

}

extension Splash.Action {

    public enum Private: Equatable, Sendable {

        case pauseCountdown

        case resumeCountdown

    }

}

// MARK: - State
extension Splash {
    public struct State: Equatable, Sendable {
        
        public var timer: CountdownTimer.State
        public let title: String
        public let isShowingLoadingSpinner: Bool
        
        public init(
            timer: CountdownTimer.State,
            title: String,
            isShowingLoadingSpinner: Bool = true
        ) {
            self.timer = timer
            self.title = title
            self.isShowingLoadingSpinner = isShowingLoadingSpinner
        }
        
    }
}
