//
//  TernaryButton.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 26.09.2023.
//

import SwiftUI

struct TernaryButton: View {
    let labelText: String
    
    var body: some View {
        Text(labelText)
            .foregroundColor(.yellow)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, UICConstants.HIG.paddingLarge2)
    }
}
