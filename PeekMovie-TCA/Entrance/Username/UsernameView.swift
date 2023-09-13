//
//  SignInView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import SwiftUI
import ComposableArchitecture

private enum Constants {
    static let paddingSmall: CGFloat = 8
    static let padding: CGFloat = 16
    static let paddingMedium: CGFloat = 24
    static let paddingLarge: CGFloat = 32
    static let paddingLargeExtra: CGFloat = 64
    
    static let cornerRadius: CGFloat = 12
    static let strokeWidth: CGFloat = 1
    
    static let opacityBG: CGFloat = 0.1
    static let opacityDisabled: CGFloat = 0.3
    static let opacityFull: CGFloat = 1
    
    static let mainBtnSize: CGSize = .init(width: 280, height: 50)
    
    static let actionText: String = "Enter your username"
    static let tipText: String = "Or you can use your email"
    static let tfPlaceholder: String = "Username or email"
    
    static let continueText: String = "Continue"
    static let registerText: String = "Register"
}

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
                    
                    VStack(spacing: 24) {
//                        Assets.Icon.app(.x128)
//                            .padding(24)
//                            .padding(.top, 120)
                        PeekLogo()
                        
                        UsernameTextField(text: viewStore.binding(get: \.username, send: {.view(.didChangeUsername($0))}  ))
//                        TextField(String.empty, text: viewStore.binding(get: \.username, send: { .view(.didChangeUsername($0)) } ))
//                            .autocorrectionDisabled()
//                            .foregroundColor(.white)
//                            .placeholder(when: viewStore.username.isEmpty) {
//                                Text("Username")
//                                    .foregroundColor(.gray)
//                            }
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background {
//                                Color(.yellow)
//                                    .opacity(0.1)
//                            }
//                            .mask {
//                                RoundedRectangle(cornerRadius: 12)
//                            }
//                            .overlay {
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(lineWidth: 1)
//                                    .foregroundColor(.yellow)
//
//                            }
//                            .padding(.horizontal, 48)
                        
                        
                        Button {
                            viewStore.send(.view(.didTapOnContinue))
                        } label: {
                            ContinueButton(
                                isPerformingPasswordCheck: viewStore.binding(get: \.isPerformingUsernameCheck, send: .view(.getValue)),
                                isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue))
                            )
//                            ZStack {
//                                Text("Continue")
//                                    .foregroundColor(.black.opacity(viewStore.isPerformingUsernameCheck ? 0.3 : 1))
////                                    .frame(width: 280, height: 50)
//                                    .frame(maxWidth: .infinity, maxHeight: 50)
//                                    .background(.yellow.opacity(viewStore.isPerformingUsernameCheck ? 0.3 : 1))
//                                    .font(.system(size: 20, weight: .bold))
//                                    .cornerRadius(12)
//                                    .padding(.horizontal, 48)
//
//                                if viewStore.isFetching {
//                                    ProgressView()
//                                }
//                            }
                                
                        }
                        .disabled(viewStore.isPerformingUsernameCheck)
                        
                        
                        Spacer()
                        
                        Button {
                            print("\nRegister tapped")
                        } label: {
                            RegisterButton(isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue)))
//                            Text("Register")
//                                .foregroundColor(.white)
////                                .frame(width: 280, height: 50)
//                                .frame(maxWidth: .infinity, maxHeight: 50)
//                                .background(.purple)
//                                .font(.system(size: 20, weight: .bold))
//                                .cornerRadius(10)
//                                .padding(.horizontal, 48)
                        }
                        .padding(.bottom, 40)
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
            Assets.Icon.app(.x128)
                .padding(24)
            
            Text(Constants.actionText)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, Constants.paddingSmall)
                
            
            Text(Constants.tipText)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.top, Constants.paddingMedium)
        .padding(.bottom, Constants.paddingLarge)
    }
}

private struct UsernameTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField(String.empty, text: $text)
            .autocorrectionDisabled()
            .foregroundColor(.white)
            .placeholder(when: text.isEmpty) {
                Text(Constants.tfPlaceholder).foregroundColor(.gray)
            }
            .textContentType(.password)
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                Color(.yellow)
                    .opacity(Constants.opacityBG)
            }
            .mask {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
            }
            .overlay {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(lineWidth: Constants.strokeWidth)
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal, 48)
    }
}

private struct ContinueButton: View {
    @Binding var isPerformingPasswordCheck: Bool
    @Binding var isFetching: Bool
    
    var body: some View {
        ZStack {
            Text(Constants.continueText)
                .foregroundColor(.black.opacity(isPerformingPasswordCheck ? Constants.opacityDisabled : Constants.opacityFull))
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.yellow.opacity(isPerformingPasswordCheck ? Constants.opacityDisabled : Constants.opacityFull))
                .font(.headline.bold())
                .cornerRadius(Constants.cornerRadius)
                .padding(.horizontal, 48)

            if isFetching {
                ProgressView()
                    .tint(.white)
            }
        }
    }
}

private struct RegisterButton: View {
    @Binding var isFetching: Bool
    
    var body: some View {
        ZStack {
            Text(Constants.registerText)
                .foregroundColor(.white.opacity(isFetching ? Constants.opacityDisabled : Constants.opacityFull))
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.purple.opacity(isFetching ? Constants.opacityDisabled : Constants.opacityFull))
                .font(.headline.bold())
                .cornerRadius(Constants.cornerRadius)
                .padding(.horizontal, 48)

            if isFetching {
                ProgressView()
                    .tint(.white)
            }
        }
    }
}

