//
//  RegistrationView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 06.09.2023.
//

import SwiftUI
import ComposableArchitecture

struct RegistrationView: View {
    
    init(store: StoreOf<Registration>) {
        
    }
    
    var body: some View {
        ZStack {
            Color(.brown)
            
            Text("Registration")
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
