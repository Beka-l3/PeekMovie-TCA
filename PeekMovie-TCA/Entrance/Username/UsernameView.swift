//
//  SignInView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import SwiftUI
import ComposableArchitecture


// MARK: - View
struct UsernameView: View {
    
    private let store: StoreOf<Username>
    
    init(store: StoreOf<Username>) {
        self.store = store
    }
    
    var body: some View {
        NavigationStackStore(
            self.store.scope(state: \.path, action: Username.Action.path)
        ) {
            WithViewStore(store, observe: { $0 }) { viewStore in
                ZStack {
                    Color(.black)
                        .ignoresSafeArea()
                    
                    VStack(spacing: UICConstants.HIG.paddingMedium) {
                        PeekLogo()
                        
                        MainTextField(
                            text: viewStore.binding(get: \.username, send: {.view(.didChangeUsername($0))}  ),
                            placeholder: UICConstants.Text.UsernamePage.usernamePlaceholder
                        )
                        
                        Button {
                            viewStore.send(.view(.didTapOnContinue))
                        } label: {
                            MainTextFieldButton(
                                isPerformingPasswordCheck: viewStore.binding(get: \.isPerformingUsernameCheck, send: .view(.getValue)),
                                isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue)),
                                labelText: UICConstants.Text.continueButton
                            )
                        }
                        .disabled(viewStore.isPerformingUsernameCheck)
                        
                        Spacer()
                        
                        Button {
                            print("\nRegister tapped")
                        } label: {
                            SecondaryFetchingButton(
                                isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue)),
                                labelText: UICConstants.Text.UsernamePage.registerButton
                            )
                        }
                        .padding(.bottom, UICConstants.HIG.paddingLargeExtra)
                    }
                }
            }
            
        } destination: {
            switch $0 {
            case .password:
                CaseLet(
                    /Username.State.Path.password,
                     action: Username.Action.Path.password,
                     then: PasswordView.init
                )
            case .registration:
                CaseLet(
                    /Username.State.Path.registration,
                     action: Username.Action.Path.registration,
                     then: RegistrationView.init
                )
            }
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView(store: .init(
            initialState: .init()) {
                Username()
            }
        )
    }
}


// MARK: - Components

private struct PeekLogo: View {
    var body: some View {
        VStack {
            Icon.app(.x128)
                .padding(UICConstants.HIG.paddingMedium)
            
            Text(UICConstants.Text.UsernamePage.action)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, UICConstants.HIG.paddingSmall)
                
            Text(UICConstants.Text.UsernamePage.tip)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.top, UICConstants.HIG.paddingMedium)
        .padding(.bottom, UICConstants.HIG.paddingLarge)
    }
}


