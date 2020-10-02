//
//  BodyItem.swift
//  samples-swiftui
//
//  Created by Leo Wang on 1/10/20.
//

import Foundation
import SwiftUI

struct BodyItem: Identifiable {
    var id: String
    var dataType: DataType
    var data: Any?

    enum DataType {
        case url
        case text
    }
}
