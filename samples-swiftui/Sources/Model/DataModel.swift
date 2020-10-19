//
//  User.swift
//  samples-swiftui
//
//  Created by Leo Wang on 2/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Equatable {
    let id: String
    let name: String
    let subscription: String
}

struct Header {
    var id: String = ""
    var title: String = ""
    var btnTitle: String = ""
    var enabled: Bool = false
    var gradient: Gradient = Gradient(colors: [])
}

struct BodyItem: Identifiable {
    var id: String
    var dataType: DataType
    var data: Any?

    enum DataType {
        case hero
        case banner
    }
}

