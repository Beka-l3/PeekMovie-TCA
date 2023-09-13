//
//  PasswordView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture

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
                
                VStack(spacing: 24) {
//                    PeekIdView(username: viewStore.)
//                    HStack(spacing: 8) {
//                        Text("id")
//                            .foregroundColor(.white)
//                            .font(.title.bold())
//
//                        Assets.Icon.app(.x48)
//
//                    }
//                    .padding(.vertical, 120)
                    
                    TextField("", text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ) )
                        .autocorrectionDisabled()
                        .foregroundColor(.white)
                        .placeholder(when: viewStore.password.isEmpty) {
                            Text("Password").foregroundColor(.gray)
                        }
                        .textContentType(.password)
                        .frame(maxWidth: 240)
                        .padding()
                        .background {
                            Color(.yellow)
                                .opacity(0.1)
                        }
                        .mask {
                            RoundedRectangle(cornerRadius: 16)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.yellow)
                        }
                    
                    
                    Button {
                        viewStore.send(.view(.didTapOnContinue))
                    } label: {
                        ZStack {
                            Text("Continue")
                                .foregroundColor(.black.opacity(viewStore.isPerformingPasswordCheck ? 0.3 : 1))
                                .frame(width: 280, height: 50)
                                .background(.yellow.opacity(viewStore.isPerformingPasswordCheck ? 0.3 : 1))
                                .font(.system(size: 20, weight: .bold))
                                .cornerRadius(10)

                            if viewStore.isFetching {
                                ProgressView()
                            }
                        }

                    }
                    .disabled(viewStore.isPerformingPasswordCheck)
                    
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(store: .init(initialState: Password.State()) {
            Password()
        })
    }
}


private struct PeekIdView: View {
    let username: String
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Text("id")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Assets.Icon.app(.x48)
            }
            .padding(.bottom, 16)
            
            Text("Enter your password")
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, 8)
                
            
            Text("Password for peek id with username")
                .font(.caption)
                .foregroundColor(.gray)
                
            Text(username)
                .font(.caption)
                .foregroundColor(.yellow)
        }
        .padding(.top, 16)
    }
}
