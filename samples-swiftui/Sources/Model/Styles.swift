//
//  Styles.swift
//  samples-swiftui
//
//  Created by Leo Wang on 2/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation
import SwiftUI

enum Styles {

    static let headerColor = Color(.sRGB, red: 170/255, green: 85/255, blue: 85/255, opacity: 1)
    static let defaultGradient = Gradient(colors:[Color(hex: "#6F58C4"), Color(hex: "#6200EE")])
    static let bannerColor = Color(hex: "#F0EEF9")
    static let primaryBackground = Color(hex: "#6F58C4")
}

// https://stackoverflow.com/a/56874327/11727285
extension Color {

    init(hex: String, opacity: Double? = nil) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: opacity ?? Double(a) / 255
        )
    }
}
