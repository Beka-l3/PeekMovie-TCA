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

// MARK: - Components

private struct PeekIdView: View {
let username: String
    
    var body: some View {
        VStack {
            HStack(spacing: UICConstants.HIG.paddingSmall) {
                Text(UICConstants.Text.RegistrationPage.id)
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Icon.app(.x32)
            }
            .padding(.bottom, UICConstants.HIG.paddingLarge)
            
            Text(UICConstants.Text.RegistrationPage.action)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom, UICConstants.HIG.paddingSmall)
                                
        }
        .padding(.top, UICConstants.HIG.paddingMedium)
        .padding(.bottom, UICConstants.HIG.paddingLarge)
    }
}
