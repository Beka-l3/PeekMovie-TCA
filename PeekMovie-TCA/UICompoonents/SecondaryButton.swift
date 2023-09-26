//
//  SecondaryButton.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 26.09.2023.
//

import SwiftUI

struct SecondaryFetchingButton: View {
    @Binding var isFetching: Bool
    let labelText: String
    
    var body: some View {
        ZStack {
            Text(labelText)
                .foregroundColor(.white.opacity(isFetching ? UICConstants.opacityDisabled : UICConstants.opacityFull))
                .frame(maxWidth: .infinity, maxHeight: UICConstants.shapedButtonHeight)
                .background(.purple.opacity(isFetching ? UICConstants.opacityDisabled : UICConstants.opacityFull))
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
