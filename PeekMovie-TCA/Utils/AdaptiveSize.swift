//
//  Created by Roman Nabiullin
//
//  Copyright (c) 2023 - Present
//
//  All Rights Reserved.
//

import ComposableArchitecture
import SwiftUI

// MARK: - Size

public enum AdaptiveSize: String, Equatable {

    // MARK: Case

    /// Small old iPhones. The `default` one.
    case small

    /// Modern iPhones.
    case medium

    /// Large ProMax iPhones and iPads.
    case large

}

// MARK: - Environment key

extension AdaptiveSize: DependencyKey {

    public static var defaultValue: AdaptiveSize {
        switch UIScreen.main.bounds.width {
        case ..<375:
            return .small
        case ..<428:
            return .medium
        default:
            return .large
        }
    }

    public static var liveValue: AdaptiveSize {
        return defaultValue
    }

}

// MARK: - EnvironmentValues+EnvironmentKey

extension DependencyValues {

    public var adaptiveSize: AdaptiveSize {
        get { self[AdaptiveSize.self] }
        set { self[AdaptiveSize.self] = newValue }
    }

}
