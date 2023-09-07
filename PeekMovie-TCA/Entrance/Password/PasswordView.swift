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
                Color(.orange)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    HStack(spacing: 8) {
                        Text("id")
                            .foregroundColor(.white)
                            .font(.title.bold())
                        
                        Assets.Icon.app(.x48)
                            
                    }
                    .padding(.vertical, 120)
                    
                    TextField("Password", text: viewStore.binding(get: \.password, send: { .view(.didChangePassword($0)) } ) )
                        .autocorrectionDisabled()
                        .textContentType(.password)
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
                                .foregroundColor(.white.opacity(viewStore.isPerformingPasswordCheck ? 0.3 : 1))
                                .frame(width: 280, height: 50)
                                .background(.black.opacity(viewStore.isPerformingPasswordCheck ? 0.3 : 1))
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
