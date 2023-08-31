//
//  Created by Roman Nabiullin
//
//  Copyright (c) 2023 - Present
//
//  All Rights Reserved.
//

import SwiftUI

// MARK: - Font kind

public enum FontKind: String {

    // MARK: Case

    case primary

    // MARK: Exposed properties

    var fontDescription: String {
        switch self {
        case .primary:
            return "Roboto"
        }
    }

    // MARK: Exposed methods

    func font(ofSize size: CGFloat, weight: SwiftUI.Font.Weight) -> SwiftUI.Font {
        switch (self, weight) {
        case (.primary, .black):
            return FontFamily.Roboto.black.swiftUIFont(fixedSize: size)
        case (.primary, .bold):
            return FontFamily.Roboto.bold.swiftUIFont(fixedSize: size)
        case (.primary, .light):
            return FontFamily.Roboto.light.swiftUIFont(fixedSize: size)
        case (.primary, .medium):
            return FontFamily.Roboto.medium.swiftUIFont(fixedSize: size)
        case (.primary, .regular):
            return FontFamily.Roboto.regular.swiftUIFont(fixedSize: size)
        case (.primary, .thin):
            return FontFamily.Roboto.thin.swiftUIFont(fixedSize: size)
        default:
//            log.error("Cannot find \"\(fontDescription)\" of weight \(weight). System one will be used.")
            return .system(size: size, weight: weight)
        }
    }

}
