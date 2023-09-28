//
//  Password.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import ComposableArchitecture

struct Password: Reducer {
    
    init() {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            
            case let .view(.didChangePassword(newValue)):
                state.password = newValue
                return .none
                
            case .view(.didTapOnContinue):
                state.isFetching = true
                print("\n\nStart Fetching password\n\n")
                return .run { send in
                    do {
                        try await Task.sleep(nanoseconds: 3 * UInt64(1e9))
                    } catch {
                        print(error)
                    }
                    await send(._private(.passwordIsValid))
                }
                
            case ._private(.passwordIsValid):
                state.isFetching = false
                print("\n\nFinish Fetching Password\n\n")
                return .none
                
            default:
                return .none
            }
        }
    }
}


// MARK: - Action
extension Password {
    enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case view(View)
        case _private(Private)
    }
}

extension Password.Action {
    enum Delegate: Equatable, Sendable {
        case checkPassword
        case forgotPassword
    }
}

extension Password.Action {
    enum View: Equatable, Sendable {
        case didChangePassword(String)
        case didTapOnContinue
        case getValue
    }
}

extension Password.Action {
    enum Private: Equatable, Sendable {
        case passwordIsValid
        case passwordIsNotValid
    }
}




// MARK: - State

extension Password {
    struct State: Equatable, Sendable {
        
        let username: String
        var password: String
        
        var isFetching: Bool
        
        var isPerformingPasswordCheck: Bool {
            password.isEmpty || isFetching
        }
        
        init(
            username: String = .empty,
            password: String = .empty,
            isFetching: Bool = false
        ) {
            self.username = username
            self.password = password
            self.isFetching = isFetching
        }
    }
}
