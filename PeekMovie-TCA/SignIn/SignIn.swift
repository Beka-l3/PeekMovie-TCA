//
//  SignIn.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import ComposableArchitecture

public struct SignIn: Reducer {
    
//    @Dependency(\.toastClient) private var toastClient
//    @Dependency(\.userClient) private var userClient
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .delegate:
                return.none
                
            case .view(.didTapContinueButton):
                return .send(._private(.continueToPassword))
                
            case let ._private(.setIsPerformingUsernameCheck(isPerformingUsernameCheck)):
                state.isPerformingUsernameCheck = isPerformingUsernameCheck
                return .none
                
            case ._private(.continueToPassword):
                return .run { send in
                    await send(._private(.setIsPerformingUsernameCheck(true)))
                    do {
//                        try await userClient.signIn()
                        try await Task.sleep(nanoseconds: 2 * 1000000000)
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
        case didTapContinueButton
    }
}

extension SignIn.Action {
    public enum Private: Equatable, Sendable {
        case setIsPerformingUsernameCheck(Bool)
        case continueToPassword
    }
}


// MARK: - State
extension SignIn {
    public struct State: Equatable, Sendable {
        
        @BindingState var username: String
        
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
