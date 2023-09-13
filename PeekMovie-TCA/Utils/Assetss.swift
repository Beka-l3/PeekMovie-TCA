//
//  Assetss.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 07.09.2023.
//

import SwiftUI

enum Assets {
    
    
    
    enum Icon {
        enum Size: CGFloat {
            case x16 = 16
            case x24 = 24
            case x32 = 32
            case x44 = 44
            case x48 = 48
            case x64 = 64
            case x128 = 128
            case x256 = 256
        }
        
        static func app(_ size: Size) -> some View  {
            Image("App Icon").resizable().frame(width: size.rawValue, height: size.rawValue).cornerRadius(size.rawValue / 5)
        }
    }
}
