//
//  Application.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import ComposableArchitecture

public struct Application: Reducer {
    
    @Dependency(\.userClient) private var userClient
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.screen, action: /Action.screen) {
            ApplicationScreen()
        }
        
        Reduce { state, action in
            switch action {
            case .delegate(.didFinishLaunching):
                return .send(._private(.setupOnLaunch))
                
            case .screen(.splash(.delegate(.shouldClose))):
                print("\n case .screen(.splash(.delegate(.shouldClose))): \n")
                return .send(._private(.setSplashFinished))
                
            case .screen(_):
                return .none
                
            case ._private(.setSetupOnLaunchFinished):
                state.isSetupOnLaunchFinished = true
                return state.canSetScreenAfterLaunch
                ? .send(._private(.setScreenAfterLaunch))
                : .none
                
            case ._private(.setSplashFinished):
                state.isSplashFinished = true
                return state.canSetScreenAfterLaunch
                ? .send(._private(.setScreenAfterLaunch))
                : .none
            
            case ._private(.setScreenAfterLaunch):
                switch state.preferredScreenAfterLaunch {
                case .lobby:
                    state.screen = .lobby
                case .signIn:
                    state.screen = .signIn(.init())
                }
                return .none
                
            case ._private(.setupOnLaunch):
                print("\n case ._private(.setupOnLaunch): \n")
                return .run { send in
                    
                    
                    await send(._private(.setSetupOnLaunchFinished))
                }
            }
        }
    }
}

// MARK: - Action
extension Application {
    public enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case screen(ApplicationScreen.Action)
        case _private(Private)
    }
}

extension Application.Action {
    public enum Delegate: Equatable, Sendable {
        case didFinishLaunching
    }
}

extension Application.Action {
    public enum Private: Equatable, Sendable {
        case setupOnLaunch
        case setSplashFinished
        case setScreenAfterLaunch
        case setSetupOnLaunchFinished
    }
}


// MARK: - State
extension Application {
    public struct State: Equatable, Sendable {
        public var canSetScreenAfterLaunch: Bool {
            return isSetupOnLaunchFinished && isSplashFinished
        }

        public var isSetupOnLaunchFinished: Bool
        public var isSplashFinished: Bool
        public var preferredScreenAfterLaunch: PreferredScreenAfterLaunch
        public var screen: ApplicationScreen.State
        
        private init(
            isSetupOnLaunchFinished: Bool,
            isSplashFinished: Bool,
            preferredScreenAfterLaunch: PreferredScreenAfterLaunch,
            screen: ApplicationScreen.State
        ) {
            self.isSetupOnLaunchFinished = isSetupOnLaunchFinished
            self.isSplashFinished = isSplashFinished
            self.preferredScreenAfterLaunch = preferredScreenAfterLaunch
            self.screen = screen
        }
        
        public static func setupDuringSplash() -> State {
            return State(
                isSetupOnLaunchFinished: false,
                isSplashFinished: false,
                preferredScreenAfterLaunch: .signIn,
                screen: .splash(.init(
                    timer: .init(totalTicks: Constants.Splash.splashDurationInSeconds),
                    title: "Peek Movie"
                ))
            )
        }
    }
}

extension Application.State {
    public enum PreferredScreenAfterLaunch: Equatable, Sendable {
        case lobby
        case signIn
    }
}
