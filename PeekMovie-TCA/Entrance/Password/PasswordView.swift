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
                    PeekIdView(username: viewStore.username)
                    
                    PasswordTextField(text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ) )
                    
                    Button {
                        
                    } label: {
                        Text("I forgot peek id password")
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                    }
                    
                    Spacer()
                    
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
                    .padding(.bottom, 64)
                    
                    
//                    Spacer()
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


private struct PeekIdView: View {
    let username: String
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Text("id")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Assets.Icon.app(.x32)
            }
            .padding(.bottom, 32)
            
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
        .padding(.top, 24)
        .padding(.bottom, 32)
    }
}

private struct PasswordTextField: View {
    @Binding var text: String
    
    private enum Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 1
        static let bgOpacity: CGFloat = 0.1
        static let horPadding: CGFloat = 16
        static let placeholder: String = "Password"
    }
    
    var body: some View {
        TextField(String.empty, text: $text)
            .autocorrectionDisabled()
            .foregroundColor(.white)
            .placeholder(when: text.isEmpty) {
                Text(Constants.placeholder).foregroundColor(.gray)
            }
            .textContentType(.password)
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                Color(.yellow)
                    .opacity(Constants.bgOpacity)
            }
            .mask {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
            }
            .overlay {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(lineWidth: Constants.lineWidth)
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal, Constants.horPadding)
    }
}
