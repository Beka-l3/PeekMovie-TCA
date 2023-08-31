//
//  ApplicationScreen.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import ComposableArchitecture


public struct ApplicationScreen: Reducer {
    
    public init() {

    }
    
    public var body: some ReducerOf<Self> {
        Reduce { _, _ in
            return .none
        }
        .ifCaseLet(/State.splash, action: /Action.splash) {
            Splash()
        }
        
    }
}

extension ApplicationScreen {
    
    public enum Action: Equatable, Sendable {
        case signIn
        case lobby
        case splash(Splash.Action)
    }
    
}

extension ApplicationScreen {
    
    public enum State: Equatable, Identifiable, Sendable {

        case signIn
        case lobby
        case splash(Splash.State)

        // MARK: Exposed properties

        public var id: String {
            switch self {
            case .signIn:
                return "signIn"
            case .lobby:
                return "lobby"
            case .splash:
                return "splash"
            }
        }
    }
    
}
