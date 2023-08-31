//
//  CGSize+square.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import CoreGraphics
import Foundation

extension CGSize {

    public static func square(_ side: CGFloat) -> CGSize {
        return CGSize(width: side, height: side)
    }

}
