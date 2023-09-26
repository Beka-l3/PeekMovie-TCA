//
//  MainButton.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 26.09.2023.
//

import SwiftUI

struct MainTextFieldButton: View {
    @Binding var isPerformingPasswordCheck: Bool
    @Binding var isFetching: Bool
    let labelText: String
    
    var body: some View {
        ZStack {
            Text(labelText)
                .foregroundColor(.black.opacity(isPerformingPasswordCheck ? UICConstants.HIG.opacityDisabled : UICConstants.HIG.opacityFull))
                .frame(maxWidth: .infinity, maxHeight: UICConstants.HIG.shapedButtonHeight)
                .background(.yellow.opacity(isPerformingPasswordCheck ? UICConstants.HIG.opacityDisabled : UICConstants.HIG.opacityFull))
                .font(.headline.bold())
                .cornerRadius(UICConstants.HIG.cornerRadius)
                .padding(.horizontal, UICConstants.HIG.paddingLarge2)

            if isFetching {
                ProgressView()
                    .tint(.white)
            }
        }
    }
}
