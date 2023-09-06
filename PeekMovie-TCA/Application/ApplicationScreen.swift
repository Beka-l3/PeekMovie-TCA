//
//  ApplicationScreen.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import ComposableArchitecture


struct ApplicationScreen: Reducer {
    
    init() {

    }
    
    var body: some ReducerOf<Self> {
        Reduce { _, _ in
            return .none
        }
        .ifCaseLet(/State.entrance, action: /Action.entrance) {
            Entrance()
        }
        .ifCaseLet(/State.splash, action: /Action.splash) {
            Splash()
        }
    }
}

extension ApplicationScreen {
    
    enum Action: Equatable, Sendable {
        case entrance(Entrance.Action)
        case lobby
        case splash(Splash.Action)
    }
    
}

extension ApplicationScreen {
    
    enum State: Equatable, Identifiable, Sendable {

        case entrance(Entrance.State)
        case lobby
        case splash(Splash.State)

        // MARK: Exposed properties

        var id: String {
            switch self {
            case .entrance:
                return "entrance"
            case .lobby:
                return "lobby"
            case .splash:
                return "splash"
            }
        }
    }
    
}
