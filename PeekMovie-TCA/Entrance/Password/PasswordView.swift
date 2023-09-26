//
//  PasswordView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture

private enum Constants {
    static let idText: String = "id"
    static let actionText: String = "Enter your password"
    static let tipText: String = "Password for peek id with username"
    static let passwordTFPlaceholder: String = "Password"
    
    static let forgotButtonText: String = "I forgot my peek id password"
    static let continueButtonText: String = "Continue"
}

// MARK: - View
struct PasswordView: View {
    
    private let store: StoreOf<Password>
    
    init(store: StoreOf<Password>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack(spacing: UICConstants.paddingMedium) {
                    PeekIdView(username: viewStore.username)
                    
                    MainTextField(
                        text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ),
                        placeholder: Constants.passwordTFPlaceholder
                    )
                    
                    Button {
                        
                    } label: {
                        TernaryButton(labelText: Constants.forgotButtonText)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.view(.didTapOnContinue))
                    } label: {
                        MainTextFieldButton(
                            isPerformingPasswordCheck: viewStore.binding(get: \.isPerformingPasswordCheck, send: .view(.getValue)),
                            isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue)),
                            labelText: Constants.continueButtonText
                        )
                    }
                    .disabled(viewStore.isPerformingPasswordCheck)
                    .padding(.bottom, UICConstants.paddingLargeExtra)
                }
            }
        }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(store: .init(initialState: Password.State(username: "ezpzbaby")) {
            Password()
        })
    }
}


// MARK: - Components

private struct PeekIdView: View {
    let username: String
    
    var body: some View {
        VStack {
            HStack(spacing: UICConstants.paddingSmall) {
                Text(Constants.idText)
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Icon.app(.x32)
            }
            .padding(.bottom, UICConstants.paddingLarge)
            
            Text(Constants.actionText)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, UICConstants.paddingSmall)
                
            
            Text(Constants.tipText)
                .font(.caption)
                .foregroundColor(.gray)
                
            Text(username)
                .font(.caption)
                .foregroundColor(.yellow)
        }
        .padding(.top, UICConstants.paddingMedium)
        .padding(.bottom, UICConstants.paddingLarge)
    }
}
