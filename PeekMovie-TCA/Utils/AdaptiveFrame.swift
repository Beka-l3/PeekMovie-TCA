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

struct AdaptiveFrameModifier: ViewModifier {

    // MARK: Private properties

    @Dependency(\.adaptiveSize) private var adaptiveSize

    private var adaptiveIncrement: CGFloat {
        switch adaptiveSize {
        case .small:
            return 0
        case .medium:
            return 2
        case .large:
            return 4
        }
    }

    private let width: CGFloat?

    private let height: CGFloat?

    private let alignment: Alignment

    // MARK: Init

    init(width: CGFloat?, height: CGFloat?, alignment: Alignment) {
        self.width = width
        self.height = height
        self.alignment = alignment
    }

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .frame(
                width: width.flatMap({ $0 + adaptiveIncrement }),
                height: height.flatMap({ $0 + adaptiveIncrement }),
                alignment: alignment
            )
    }

}

// MARK: - View+adaptiveFrame

extension View {

    @ViewBuilder public func adaptiveFrame(
        size: CGSize?,
        alignment: Alignment = .center
    ) -> some View {
        modifier(AdaptiveFrameModifier(width: size?.width, height: size?.height, alignment: alignment))
    }

    @ViewBuilder public func adaptiveFrame(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        alignment: Alignment = .center
    ) -> some View {
        modifier(AdaptiveFrameModifier(width: width, height: height, alignment: alignment))
    }

}
