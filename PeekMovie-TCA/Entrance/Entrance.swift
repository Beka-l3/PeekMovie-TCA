//
//  SignIn.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import ComposableArchitecture

public struct Entrance: Reducer {
    
//    @Dependency(\.toastClient) private var toastClient
    @Dependency(\.userClient) private var userClient
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .delegate:
                return.none
                
            case .username(_):
                return .none
                
            case let ._private(.setIsPerformingUsernameCheck(isPerformingUsernameCheck)):
                state.isPerformingUsernameCheck = isPerformingUsernameCheck
                return .none
                
            case ._private(.checkUsername):
                let username = state.username.username
                return .run { send in
                    await send(._private(.setIsPerformingUsernameCheck(true)))
                    do {
                        try await userClient.checkUsername(username)
                        await send(._private(.setIsPerformingUsernameCheck(false)))
                        await send(._private(.usernameExists))
                    } catch {
                        await send(._private(.setIsPerformingUsernameCheck(false)))
                    }
                }
                
            case ._private:
                return .none
            }
        }
    }
}

// MARK: - Action
extension Entrance {
    public enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case username(Username.Action)
        case _private(Private)
    }
}

extension Entrance.Action {
    public enum Delegate: Equatable, Sendable {
        case signedInSuccesfully
        case registeredSuccesfully
    }
}

extension Entrance.Action {
    public enum Private: Equatable, Sendable {
        case setIsPerformingUsernameCheck(Bool)
        case checkUsername
        case usernameExists
        case usernameDoesNotExist
    }
}


// MARK: - State
extension Entrance {
    public struct State: Equatable, Sendable {
        
        public var path: StackState<Path>
        
        public let username: Username.State
        
        public let headerTitle: String
        public let headerDescription: String
        public let footerDescription: String
        public var isPerformingUsernameCheck: Bool

        public init(
            username: Username.State = .init(),
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

extension Entrance.State {

    public enum Path: Equatable, Sendable {

        // MARK: Case

        case password

        case registration

    }

}
