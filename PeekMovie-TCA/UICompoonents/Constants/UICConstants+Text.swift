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
        static let action: String = "Enter your username"
        static let tip: String = "Or you can use your email"
        
        static let usernamePlaceholder: String = "Username or email"
        
        static let registerButton: String = "Register"
    }
}

extension UICConstants.Text {
    enum PasswordPage {
        static let id: String = "id"
        static let action: String = "Enter your password"
        static let tip: String = "Password for peek id with username"
        
        static let passwordTFPlaceholder: String = "Password"
        
        static let forgotButton: String = "I forgot my peek id password"
    }
}

extension UICConstants.Text {
    enum RegistrationPage {
        static let id: String = "id"
        static let action: String = "Register your Peek ID"
        
        static let usernameTFPlaceholder: String = "Username"
        static let emailTFPlaceholder: String = "Email"
        static let passwordTFPlaceholder: String = "Password"
        
        static let registerButton: String = "Register"
    }
}
