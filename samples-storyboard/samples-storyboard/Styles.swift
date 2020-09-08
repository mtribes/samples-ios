//
//  Styles.swift
//  samples-storyboard
//
//  Created by Leo Wang on 7/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit

enum Styles {

    static let headerColor = UIColor(red: 170/255, green: 85/255, blue: 85/255, alpha: 1)
    static let bannerColor = UIColor(hex: "#F0EEF9")
    static let primaryBackground = UIColor(hex: "#6F58C4")
}

extension UIColor {

    // https://www.iosapptemplates.com/blog/swift-programming/convert-hex-colors-to-uicolor-swift-4
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
