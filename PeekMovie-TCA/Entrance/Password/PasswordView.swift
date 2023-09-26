//
//  PasswordView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture


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
                
                VStack(spacing: UICConstants.HIG.paddingMedium) {
                    PeekIdView(username: viewStore.username)
                    
                    MainTextField(
                        text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ),
                        placeholder: UICConstants.Text.PasswordPage.passwordTFPlaceholder
                    )
                    
                    Button {
                        
                    } label: {
                        TernaryButton(labelText: UICConstants.Text.PasswordPage.forgotButtonText)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.view(.didTapOnContinue))
                    } label: {
                        MainTextFieldButton(
                            isPerformingPasswordCheck: viewStore.binding(get: \.isPerformingPasswordCheck, send: .view(.getValue)),
                            isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue)),
                            labelText: UICConstants.Text.continueButton
                        )
                    }
                    .disabled(viewStore.isPerformingPasswordCheck)
                    .padding(.bottom, UICConstants.HIG.paddingLargeExtra)
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
            HStack(spacing: UICConstants.HIG.paddingSmall) {
                Text(UICConstants.Text.PasswordPage.idText)
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Icon.app(.x32)
            }
            .padding(.bottom, UICConstants.HIG.paddingLarge)
            
            Text(UICConstants.Text.PasswordPage.actionText)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, UICConstants.HIG.paddingSmall)
                
            Text(UICConstants.Text.PasswordPage.tipText)
                .font(.caption)
                .foregroundColor(.gray)
                
            Text(username)
                .font(.caption)
                .foregroundColor(.yellow)
        }
        .padding(.top, UICConstants.HIG.paddingMedium)
        .padding(.bottom, UICConstants.HIG.paddingLarge)
    }
}
