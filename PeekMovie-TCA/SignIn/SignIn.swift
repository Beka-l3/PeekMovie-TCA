//
//  SignIn.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import ComposableArchitecture

public struct SignIn: Reducer {
    
//    @Dependency(\.toastClient) private var toastClient
    @Dependency(\.userClient) private var userClient
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .delegate:
                return.none
            
            case let .view(.didTapContinueButton(username)):
                return .send(._private(.checkUsername(username)))
            
            case let .view(.usernameTextFieldDidChange(newValue)):
                print("\nUsername: \(newValue)")
                state.username = newValue
                return .none
                
            case let ._private(.setIsPerformingUsernameCheck(isPerformingUsernameCheck)):
                state.isPerformingUsernameCheck = isPerformingUsernameCheck
                return .none
                
            case let ._private(.checkUsername(username)):
                return .run { send in
                    await send(._private(.setIsPerformingUsernameCheck(true)))
                    do {
                        print("\ncase let ._private(.checkUsername(username)):\n")
                        try await userClient.checkUsername(username)
                        print("\ntry await userClient.checkUsername(username)\n")
//                        try await Task.sleep(nanoseconds: 2 * 1000000000)
                        await send(._private(.setIsPerformingUsernameCheck(false)))
                        await send(.delegate(.usernameExists))
//                    } catch UserClient.Error.usernameDoesnotExist {
//                        await send(._private(.setIsPerformingUsernameCheck(false)))
//                        await send(.delegate(.usernameDoesnotExist))
                    } catch {
//                        log.error("Cannot sign in due to \(error).")
                        await send(._private(.setIsPerformingUsernameCheck(false)))
                    }
                }
            }
        }
    }
}

// MARK: - Action
extension SignIn {
    public enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case view(View)
        case _private(Private)
    }
}

extension SignIn.Action {
    public enum Delegate: Equatable, Sendable {
        case usernameExists
        case usernameDoesnotExist
    }
}

extension SignIn.Action {
    public enum View: Equatable, Sendable {
        case didTapContinueButton(String)
        case usernameTextFieldDidChange(String)
    }
}

extension SignIn.Action {
    public enum Private: Equatable, Sendable {
        case setIsPerformingUsernameCheck(Bool)
        case checkUsername(String)
    }
}


// MARK: - State
extension SignIn {
    public struct State: Equatable, Sendable {
        
        public var username: String
        
        public let headerTitle: String
        public let headerDescription: String
        public let footerDescription: String
        public var isPerformingUsernameCheck: Bool

        public init(
            username: String = .empty,
            headerTitle: String = L10n.signInHeaderTitle,
            headerDescription: String = L10n.signInHeaderDescription,
            footerDescription: String = L10n.signInFooterMarkdownText,
            isPerformingUsernameCheck: Bool = false
        ) {
            self.username = username
            self.headerTitle = headerTitle
            self.headerDescription = headerDescription
            self.footerDescription = footerDescription
            self.isPerformingUsernameCheck = isPerformingUsernameCheck
        }
        
    }
}
