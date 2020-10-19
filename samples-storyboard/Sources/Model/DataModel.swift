//
//  User.swift
//  samples-storyboard
//
//  Created by Leo Wang on 7/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let id: String
    let name: String
    let subscription: String
}

struct Header {
    var id: String = ""
    var title: String = ""
    var btnTitle: String = ""
    var enabled: Bool = false
    var colors: [UIColor?] = []
}

struct BodyItem {
    var id: String
    var dataType: DataType
    var data: Any?

    enum DataType {
        case hero
        case banner
    }
}
