//
//  MainButton.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 26.09.2023.
//

import SwiftUI

struct MainButton: View {
    @Binding var isPerformingPasswordCheck: Bool
    @Binding var isFetching: Bool
    let labelText: String
    
    var body: some View {
        ZStack {
            Text(labelText)
                .foregroundColor(.black.opacity(isPerformingPasswordCheck ? UICConstants.opacityDisabled : UICConstants.opacityFull))
                .frame(maxWidth: .infinity, maxHeight: UICConstants.shapedButtonHeight)
                .background(.yellow.opacity(isPerformingPasswordCheck ? UICConstants.opacityDisabled : UICConstants.opacityFull))
                .font(.headline.bold())
                .cornerRadius(UICConstants.cornerRadius)
                .padding(.horizontal, UICConstants.paddingLarge2)

            if isFetching {
                ProgressView()
                    .tint(.white)
            }
        }
    }
}
