//
//  Created by Roman Nabiullin
//
//  Copyright (c) 2023 - Present
//
//  All Rights Reserved.
//

import ComposableArchitecture
import SwiftUI

// MARK: - Modifier

struct AdaptiveFontModifier: ViewModifier {

    // MARK: Private properties

    @Dependency(\.adaptiveSize) private var adaptiveSize

    private var fontAdaptiveSize: CGFloat {
        switch adaptiveSize {
        case .small:
            return fontSize
        case .medium:
            return fontSize + 1
        case .large:
            return fontSize + 3
        }
    }

    private let fontKind: FontKind

    private let fontSize: CGFloat

    private let fontWeight: SwiftUI.Font.Weight

    // MARK: Init

    init(fontKind: FontKind, fontWeight: SwiftUI.Font.Weight, fontSize: CGFloat) {
        self.fontKind = fontKind
        self.fontWeight = fontWeight
        self.fontSize = fontSize
    }

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .font(fontKind.font(ofSize: fontAdaptiveSize, weight: fontWeight))
    }

}

// MARK: - View+adaptiveFont

extension View {

    /// Sets the font for text in this view. Font size is adjusted based on the screen width.
    @ViewBuilder public func adaptiveFont(
        _ fontKind: FontKind,
        _ weight: SwiftUI.Font.Weight,
        ofSize size: CGFloat
    ) -> some View {
        modifier(AdaptiveFontModifier(fontKind: fontKind, fontWeight: weight, fontSize: size))
    }

}
