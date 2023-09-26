//
//  UICConstants+Text.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 26.09.2023.
//

import Foundation

extension UICConstants {
    enum Text {
        static let continueButton: String = "Continue"
    }
}

extension UICConstants.Text {
    enum UsernamePage {
        static let actionText: String = "Enter your username"
        static let tipText: String = "Or you can use your email"
        static let usernamePlaceholder: String = "Username or email"
        static let registerButtonText: String = "Register"
    }
}

extension UICConstants.Text {
    enum PasswordPage {
        static let idText: String = "id"
        static let actionText: String = "Enter your password"
        static let tipText: String = "Password for peek id with username"
        static let passwordTFPlaceholder: String = "Password"
        
        static let forgotButtonText: String = "I forgot my peek id password"
    }
}
