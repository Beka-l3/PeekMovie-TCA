//
//  RegistrationView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture

struct RegistrationView: View {
    
    private let store: StoreOf<Registration>
    
    init(store: StoreOf<Registration>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack(spacing: UICConstants.HIG.paddingMedium) {
                    PeekIdView()
                    
                    MainTextField(
                        text: viewStore.binding(get: \.username, send: { .view(.didChangeUsername($0)) } ),
                        placeholder: UICConstants.Text.RegistrationPage.usernameTFPlaceholder
                    )
                    
                    MainTextField(
                        text: viewStore.binding(get: \.email, send: { .view(.didChangeEmail($0)) } ),
                        placeholder: UICConstants.Text.RegistrationPage.emailTFPlaceholder
                    )
                    
                    MainTextField(
                        text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ),
                        placeholder: UICConstants.Text.RegistrationPage.passwordTFPlaceholder
                    )
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.view(.didTapOnRegister))
                    } label: {
                        MainTextFieldButton(
                            isPerformingPasswordCheck: viewStore.binding(get: \.isPerformingPasswordCheck, send: .view(.getValue)),
                            isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue)),
                            labelText: UICConstants.Text.RegistrationPage.registerButton
                        )
                    }
                    .disabled(viewStore.isPerformingPasswordCheck)
                    .padding(.bottom, UICConstants.HIG.paddingLargeExtra)
                }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(store: .init(initialState: Registration.State()) {
            Registration()
        })        
    }
}

// MARK: - Components

private struct PeekIdView: View {
    
    var body: some View {
        VStack {
            HStack(spacing: UICConstants.HIG.paddingSmall) {
                Text(UICConstants.Text.RegistrationPage.id)
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Icon.app(.x32)
            }
            .padding(.bottom, UICConstants.HIG.paddingLarge)
            
            Text(UICConstants.Text.RegistrationPage.action)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, UICConstants.HIG.paddingSmall)
                                
        }
        .padding(.top, UICConstants.HIG.paddingMedium)
        .padding(.bottom, UICConstants.HIG.paddingLarge)
    }
}
