//
//  ViewModel_Before.swift
//  samples-storyboard
//
//  Created by Leo Wang on 7/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation

class ViewModel_Before: ViewModel {

    private var user: User? {
        didSet {
            loginStatusChange(user)
        }
    }

    private let fakeUser = User(
        id: "2id2f459d2s5",
        name: "Olivia",
        subscription: "gold"
    )

    override func buttonTap() {
        if user == nil {
            onLogin()
        } else {
            onSignOut()
        }
    }

    override func onLogin() {
        user = fakeUser
    }

    override func onSignOut() {
        user = nil
    }

    private func loginStatusChange(_ user: User?) {
        let signedIn = user != nil
        header = signedIn ? .signedIn : .anonymous

        let imageUrl = signedIn ? Constants.imgUrlLogin : Constants.imgUrlSignOut
        let bannerMsg = signedIn ? Constants.bannerMember : Constants.bannerVisitor
        body = [
            BodyItem(id: "image", dataType: .hero, data: imageUrl),
            BodyItem(id: "banner", dataType: .banner, data: bannerMsg)
        ]

        delegate?.didFinishLoading()
    }
}

private extension Header {

    static var signedIn: Header {
        return Header(id: "0001",
                      title: "Hi Olivia",
                      btnTitle: Constants.btnSignOut,
                      enabled: true,
                      colors: Styles.defaultGradient)
    }

    static var anonymous: Header {
        return Header(id: "0001",
                      title: "Welcome",
                      btnTitle: Constants.btnLogin,
                      enabled: true,
                      colors: Styles.defaultGradient)
    }
}
