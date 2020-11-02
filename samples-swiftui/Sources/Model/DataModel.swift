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

struct FakeData {
    struct SignedIn {
        static let header = Header(id: "0001",
                                   title: "Hi Olivia",
                                   btnTitle: Constants.btnSignOut,
                                   enabled: true,
                                   gradient: Styles.defaultGradient)
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
                                   gradient: Styles.defaultGradient)
        static let body = [
            BodyItem(id: "image", dataType: .hero, data: Constants.imgUrlSignOut),
            BodyItem(id: "banner", dataType: .banner, data: Constants.bannerVisitor)
        ]
    }
}
