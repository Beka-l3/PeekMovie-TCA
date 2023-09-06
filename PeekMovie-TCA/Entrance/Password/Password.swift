//
//  Password.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import ComposableArchitecture

struct Password: Reducer {
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}


// MARK: - Action
extension Password {
    enum Action: Equatable, Sendable {
        
    }
}




// MARK: - State

extension Password {
    struct State: Equatable, Sendable {
        
    }
}
