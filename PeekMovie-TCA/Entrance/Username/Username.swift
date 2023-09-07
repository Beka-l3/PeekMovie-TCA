//
//  Username.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 03.09.2023.
//

import Foundation
import ComposableArchitecture


struct Username: Reducer {
    
    init() {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            
            case let .view(.didChangeUsername(newValue)):
                state.username = newValue
                return .none
            
            case .view(.didTapOnContinue):
                state.isFetching = true
                print("\n\nStart Fetching username\n\n")
                return .run { send in
                    do {
                        try await Task.sleep(nanoseconds: 3 * UInt64(1e9))
                    } catch {
                        print(error)
                    }
                    await send(._private(.usernameIsValid))
                }
            
            case let .path(action):
                switch action {
                default:
                    return .none
                }
            
            case ._private(.usernameIsValid):
                state.isFetching = false
                print("\n\nFinish Fetching\n\n")
                state.path.append(.password())
                return .none
                
            default:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            Path()
        }
    }
}

// MARK: - Action
extension Username {
    enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case view(View)
        case path(StackAction<Path.State, Path.Action>)
        case _private(Private)
    }
}

extension Username.Action {
    enum Delegate: Equatable, Sendable {
        case checkUsername
        case goToRegisterPage
    }
}

extension Username.Action {
    enum View: Equatable, Sendable {
        case didChangeUsername(String)
        case didTapOnContinue
        case didTapOnRegister
    }
}

extension Username.Action {
    enum Private: Equatable, Sendable {
        case usernameIsValid
        case usernameIsNotValid
    }
}



// MARK: - State
extension Username {
    struct State: Equatable, Sendable  {
        var path = StackState<Path.State>()
        
        var username: String
        var isFetching: Bool
        
        var isPerformingUsernameCheck: Bool {
            username.isEmpty || isFetching
        }
        
        var navigationTitle: String
        
        init(
            path: StackState<Path.State> = .init(),
            username: String = "",
            navigationTitle: String = "Username"
        ) {
            self.path = path
            self.username = username
            self.isFetching = false
            self.navigationTitle = navigationTitle
        }
        
    }
}

extension Username {
    struct Path: Reducer {
        public enum State: Equatable, Sendable {
            case password(Password.State = .init())
            case registration(Registration.State = .init())
        }
        
        enum Action: Equatable {
            case password(Password.Action)
            case registration(Registration.Action)
        }
        
        var body: some Reducer<State, Action> {
            Scope(state: /State.password, action: /Action.password) {
                Password()
            }
            Scope(state: /State.registration, action: /Action.registration) {
                Registration()
            }
        }
    }
}

