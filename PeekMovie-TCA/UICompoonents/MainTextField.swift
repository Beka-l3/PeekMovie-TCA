//
//  MainTextField.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 26.09.2023.
//

import SwiftUI


struct MainTextField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        TextField(String.empty, text: $text)
            .autocorrectionDisabled()
            .foregroundColor(.white)
            .placeholder(when: text.isEmpty) {
                Text(placeholder).foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                Color(.yellow)
                    .opacity(UICConstants.opacityBG)
            }
            .mask {
                RoundedRectangle(cornerRadius: UICConstants.cornerRadius)
            }
            .overlay {
                RoundedRectangle(cornerRadius: UICConstants.cornerRadius)
                    .stroke(lineWidth: UICConstants.strokeWidth)
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal, UICConstants.paddingLarge2)
    }
}
