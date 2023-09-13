//
//  PasswordView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture

private enum Constants {
    static let paddingSmall: CGFloat = 8
    static let padding: CGFloat = 16
    static let paddingMedium: CGFloat = 24
    static let paddingLarge: CGFloat = 32
    static let paddingLarge2: CGFloat = 48
    static let paddingLargeExtra: CGFloat = 64
    
    static let cornerRadius: CGFloat = 12
    static let strokeWidth: CGFloat = 1
    
    static let opacityBG: CGFloat = 0.1
    static let opacityDisabled: CGFloat = 0.3
    static let opacityFull: CGFloat = 1
    
    static let shapedButtonHeight: CGFloat = 50

    static let idText: String = "id"
    static let actionText: String = "Enter your password"
    static let tipText: String = "Password for peek id with username"
    static let tfPlaceholder: String = "Password"
    
    static let forgotText: String = "I forgot my peek id password"
    static let continueText: String = "Continue"
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
                
                VStack(spacing: Constants.paddingMedium) {
                    PeekIdView(username: viewStore.username)
                    
                    PasswordTextField(text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ) )
                    
                    Button {
                        
                    } label: {
                        Text(Constants.forgotText)
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, Constants.paddingLarge2)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.view(.didTapOnContinue))
                    } label: {
                        ContinueButton(
                            isPerformingPasswordCheck: viewStore.binding(get: \.isPerformingPasswordCheck, send: .view(.getValue)),
                            isFetching: viewStore.binding(get: \.isFetching, send: .view(.getValue))
                        )
                    }
                    .disabled(viewStore.isPerformingPasswordCheck)
                    .padding(.bottom, Constants.paddingLargeExtra)
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
            HStack(spacing: Constants.paddingSmall) {
                Text(Constants.idText)
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Assets.Icon.app(.x32)
            }
            .padding(.bottom, Constants.paddingLarge)
            
            Text(Constants.actionText)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, Constants.paddingSmall)
                
            
            Text(Constants.tipText)
                .font(.caption)
                .foregroundColor(.gray)
                
            Text(username)
                .font(.caption)
                .foregroundColor(.yellow)
        }
        .padding(.top, Constants.paddingMedium)
        .padding(.bottom, Constants.paddingLarge)
    }
}

private struct PasswordTextField: View {
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
            .padding(.horizontal, Constants.paddingLarge2)
    }
}

private struct ContinueButton: View {
    @Binding var isPerformingPasswordCheck: Bool
    @Binding var isFetching: Bool
    
    var body: some View {
        ZStack {
            Text(Constants.continueText)
                .foregroundColor(.black.opacity(isPerformingPasswordCheck ? Constants.opacityDisabled : Constants.opacityFull))
                .frame(maxWidth: .infinity, maxHeight: Constants.shapedButtonHeight)
                .background(.yellow.opacity(isPerformingPasswordCheck ? Constants.opacityDisabled : Constants.opacityFull))
                .font(.headline.bold())
                .cornerRadius(Constants.cornerRadius)
                .padding(.horizontal, Constants.paddingLarge2)

            if isFetching {
                ProgressView()
                    .tint(.white)
            }
        }
    }
}
