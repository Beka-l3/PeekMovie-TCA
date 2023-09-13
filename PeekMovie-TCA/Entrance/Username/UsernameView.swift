//
//  SignInView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 02.09.2023.
//

import SwiftUI
import ComposableArchitecture

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
                        Assets.Icon.app(.x128)
                            .padding(24)
                            .padding(.top, 120)
                        
                        TextField(String.empty, text: viewStore.binding(get: \.username, send: { .view(.didChangeUsername($0)) } ))
                            .autocorrectionDisabled()
                            .foregroundColor(.white)
                            .placeholder(when: viewStore.username.isEmpty) {
                                Text("Username")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background {
                                Color(.yellow)
                                    .opacity(0.1)
                            }
                            .mask {
                                RoundedRectangle(cornerRadius: 12)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.yellow)
                                    
                            }
                            .padding(.horizontal, 48)
                        
                        
                        Button {
                            viewStore.send(.view(.didTapOnContinue))
                        } label: {
                            ZStack {
                                Text("Continue")
                                    .foregroundColor(.black.opacity(viewStore.isPerformingUsernameCheck ? 0.3 : 1))
//                                    .frame(width: 280, height: 50)
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .background(.yellow.opacity(viewStore.isPerformingUsernameCheck ? 0.3 : 1))
                                    .font(.system(size: 20, weight: .bold))
                                    .cornerRadius(12)
                                    .padding(.horizontal, 48)
                                
                                if viewStore.isFetching {
                                    ProgressView()
                                }
                            }
                                
                        }
                        .disabled(viewStore.isPerformingUsernameCheck)
                        
                        
                        Spacer()
                        
                        Button {
                            print("\nRegister tapped")
                        } label: {
                            Text("Register")
                                .foregroundColor(.white)
//                                .frame(width: 280, height: 50)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(.purple)
                                .font(.system(size: 20, weight: .bold))
                                .cornerRadius(10)
                                .padding(.horizontal, 48)
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
