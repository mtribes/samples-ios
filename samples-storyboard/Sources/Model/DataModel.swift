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

struct FakeData {
    struct SignedIn {
        static let header = Header(id: "0001",
                                   title: "Hi Olivia",
                                   btnTitle: Constants.btnSignOut,
                                   enabled: true,
                                   colors: Styles.defaultGradient)
        static let body = [
            BodyItem(id: "image", dataType: .hero, data: Constants.imgUrlLogin),
            BodyItem(id: "banner", dataType: .banner, data: Constants.bannerMember)
        ]
    }

    struct Anonymous {
        static let header = Header(id: "0001",
                                   title: "Welcome",
                                   btnTitle: Constants.btnLogin,
                                   enabled: true,
                                   colors: Styles.defaultGradient)
        static let body = [
            BodyItem(id: "image", dataType: .hero, data: Constants.imgUrlSignOut),
            BodyItem(id: "banner", dataType: .banner, data: Constants.bannerVisitor)
        ]
    }
}
