//
//  Username.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 03.09.2023.
//

import Foundation
import ComposableArchitecture


public struct Username: Reducer {
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

// MARK: - Action
extension Username {
    public enum Action: Equatable, Sendable {
        case delegate(Delegate)
        case view(View)
        case _private(Private)
    }
}

extension Username.Action {
    public enum Delegate: Equatable, Sendable {
        case checkUsername
        case goToRegisterPage
    }
}

extension Username.Action {
    public enum View: Equatable, Sendable {
        case didChangeUsername(String)
        case didTapOnContinue
        case didTapOnRegister
    }
}

extension Username.Action {
    public enum Private: Equatable, Sendable {
        case setIsPerformingUsernameCheck(Bool)
    }
}

// MARK: - State
extension Username {
    public struct State: Equatable, Sendable  {
        
        public var username: String
        public var isPerformingUsernameCheck: Bool
        
        public var navigationTitle: String
        
        public init(
            username: String = "",
            isPerformingUsernameCheck: Bool = false,
            navigationTitle: String = "Username"
        ) {
            self.username = username
            self.isPerformingUsernameCheck = isPerformingUsernameCheck
            self.navigationTitle = navigationTitle
        }
        
    }
}
