//
//  BodyItem.swift
//  samples-storyboard
//
//  Created by Leo Wang on 2/10/20.
//

import Foundation

struct BodyItem {
    var id: String
    var dataType: DataType
    var data: Any?

    enum DataType {
        case url
        case text
    }
}
