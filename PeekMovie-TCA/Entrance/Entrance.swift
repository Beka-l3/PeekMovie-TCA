//
//  SignIn.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import ComposableArchitecture

struct Entrance: Reducer {
    
//    @Dependency(\.toastClient) private var toastClient
    @Dependency(\.userClient) private var userClient
    
    init() {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path(.element(id: _, action: .username(.delegate(.checkUsername)))):
                return .none
                
            case .path:
                return .none
                
            }
        }
        .forEach(\.path, action: /Action.path) {
            Scope(state: /State.Path.username, action: /Action.Path.username) {
                Username()
            }
            Scope(state: /State.Path.password, action: /Action.Path.password) {
                Password()
            }
            Scope(state: /State.Path.registration, action: /Action.Path.registration) {
                Registration()
            }
        }
    }
}

// MARK: - Action
extension Entrance {
    enum Action: Equatable, Sendable {
        case path(StackAction<Entrance.State.Path, Entrance.Action.Path>)
    }
}

extension Entrance.Action {
    enum Delegate: Equatable, Sendable {
        
    }
}

extension Entrance.Action {
    enum Private: Equatable, Sendable {
        
    }
}

extension Entrance.Action {
    enum Path: Equatable, Sendable {
        case username(Username.Action)
        case password(Password.Action)
        case registration(Registration.Action)
    }
}

// MARK: - State
extension Entrance {
    struct State: Equatable, Sendable {
        
        var path: StackState<Path>
        
        init(
            path: StackState<Path> = StackState([.username(.init())])
        ) {
            self.path = path
        }
    }
}

extension Entrance.State {
    enum Path: Equatable, Sendable {
        case username(Username.State)
        case password(Password.State)
        case registration(Registration.State)
    }
}
