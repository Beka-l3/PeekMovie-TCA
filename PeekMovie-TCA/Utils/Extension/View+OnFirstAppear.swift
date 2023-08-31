//
//  Created by Roman Nabiullin
//
//  Copyright (c) 2023 - Present
//
//  All Rights Reserved.
//

import SwiftUI

// MARK: - Modifier

private struct OnFirstAppearModifier: ViewModifier {

    // MARK: Private properties

    @State private var hasAppeared = false

    private let action: () -> Void

    // MARK: Init

    init(action: @escaping () -> Void) {
        self.action = action
    }

    // MARK: Body

    func body(content: Content) -> some View {
        content.onAppear {
            if !hasAppeared {
                action()
                hasAppeared = true
            }
        }
    }

}

// MARK: - View+onFirstAppear

extension View {

    @ViewBuilder public func onFirstAppear(
        action: @escaping () -> Void
    ) -> some View {
        modifier(OnFirstAppearModifier(action: action))
    }

}
