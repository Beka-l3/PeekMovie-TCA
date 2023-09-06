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
                    Color(.orange)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 24) {
                        Image("App Icon")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(24)
                            .padding(24)
                            .padding(.top, 120)
                        
                        TextField("Username", text: viewStore.binding(get: \.username, send: { .view(.didChangeUsername($0)) } ))
                            .autocorrectionDisabled()
                            .frame(maxWidth: 240)
                            .padding()
                            .background {
                                Color(.black)
                                    .opacity(0.1)
                            }
                            .mask {
                                RoundedRectangle(cornerRadius: 16)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(lineWidth: 2)
                            }
                        
                        
                        Button {
                            viewStore.send(.view(.didTapOnContinue))
                        } label: {
                            ZStack {
                                Text("Continue")
                                    .foregroundColor(.white.opacity(viewStore.isPerformingUsernameCheck ? 0.3 : 1))
                                    .frame(width: 280, height: 50)
                                    .background(.black.opacity(viewStore.isPerformingUsernameCheck ? 0.3 : 1))
                                    .font(.system(size: 20, weight: .bold))
                                    .cornerRadius(10)
                                
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
                                .foregroundColor(.black)
                                .frame(width: 280, height: 50)
                                .background(.white)
                                .font(.system(size: 20, weight: .bold))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 40)
                    }
                }
                
                
            }
        } destination: {
            switch $0 {
            case .password:
                CaseLet(
                    /Username.Path.State.password,
                     action: Username.Path.Action.password,
                     then: PasswordView.init
                )
            case .registration:
                CaseLet(
                    /Username.Path.State.registration,
                     action: Username.Path.Action.registration,
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
