//
//  Application.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import ComposableArchitecture

public struct Application: Reducer {
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
    
}

extension Application {
    
    public enum Action: Equatable {
        case screen(ApplicationScreen.Action)
    }
    
}

extension Application {
    
    public struct State: Equatable {
        
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
