//
//  UserClient.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import ComposableArchitecture
import Foundation

public struct UserClient: @unchecked Sendable {
    
    public var checkUsername: @Sendable (String) async throws -> Void
    
}

extension UserClient: DependencyKey {
    public static let liveValue: UserClient = {
        return UserClient(
            checkUsername: { username in
                sleep(3)
            }
        )
    }()
}


extension DependencyValues {

    public var userClient: UserClient {
        get { self[UserClient.self] }
        set { self[UserClient.self] = newValue }
    }

}
