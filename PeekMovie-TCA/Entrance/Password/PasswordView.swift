//
//  PasswordView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture

struct PasswordView: View {
    
    init(store: StoreOf<Password>) {
        
    }
    
    var body: some View {
        ZStack {
            Color(.green).ignoresSafeArea()
            
            Text("Password")
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
