//
//  Registration.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import ComposableArchitecture

struct Registration: Reducer {
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}


// MARK: - Action
extension Registration {
    enum Action: Equatable, Sendable {
        
    }
}




// MARK: - State

extension Registration {
    struct State: Equatable, Sendable {
        
    }
}

