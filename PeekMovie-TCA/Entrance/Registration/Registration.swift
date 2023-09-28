//
//  Registration.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import ComposableArchitecture

struct Registration: Reducer {
    
    var body: some ReducerOf<Registration> {
        Reduce { state, action in
            switch action {
            
            case .delegate:
                return .none
                
            case let .view(.didChangeUsername(newValue)):
                state.username = newValue
                return .none
                
            case let .view(.didChangeEmail(newValue)):
                state.email = newValue
                return .none
                
            case let .view(.didChangePassword(newValue)):
                state.password = newValue
                return .none
                
            case .view(.didTapOnRegister):
                state.isFetching = true
                print("\n\nStart Fetching Registration\n\n")
                return .run { send in
                    do {
                        try await Task.sleep(nanoseconds: 3 * UInt64(1e9))
                    } catch {
                        print(error)
                    }
                    await send(._private(.credentialsAreCorrect))
                }
                
            case .view:
                return .none
                
            case ._private(.credentialsAreCorrect):
                state.isFetching = false
                print("\n\nFinish Fetching Registration\n\n")
                return .none
                
            case ._private:
                return .none
            }
            
        }
    }
}

extension Registration {
    enum Credential: Equatable {
        case username
        case email
        case password
    }
}

// MARK: - Action
extension Registration {
    enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case view(View)
        case _private(Private)
    }
}

extension Registration.Action {
    enum Delegate: Equatable, Sendable {
        case checkCredentials
    }
}

extension Registration.Action {
    enum View: Equatable, Sendable {
        case didChangeUsername(String)
        case didChangeEmail(String)
        case didChangePassword(String)
        case didTapOnRegister
        case getValue
    }
}

extension Registration.Action {
    enum Private: Equatable, Sendable {
        case credentialsAreCorrect
        case incorrectCredential(Registration.Credential)
    }
}



// MARK: - State

extension Registration {
    struct State: Equatable, Sendable {
        
        var username: String
        var email: String
        var password: String
        
        var isFetching: Bool
        
        var isPerformingPasswordCheck: Bool {
            username.isEmpty || email.isEmpty || password.isEmpty || isFetching
        }
        
        init(
            username: String = .empty,
            email: String = .empty,
            password: String = .empty,
            isFetching: Bool = false
        ) {
            self.username = username
            self.email = email
            self.password = password
            self.isFetching = isFetching
        }
    }
}

