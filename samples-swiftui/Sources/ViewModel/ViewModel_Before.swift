//
//  ViewModel.swift
//  samples-swiftui
//
//  Created by Leo Wang on 3/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation
import Combine

class ViewModel_Before: ViewModel {

    @Published private var user: User?

    private let fakeUser = User(
        id: "2id2f459d2s5",
        name: "Olivia",
        subscription: "gold"
    )

    private var disposables = Set<AnyCancellable>()

    override init() {
        super.init()
        $user.receive(on: DispatchQueue.main)
            .sink(receiveValue: loginStatusChange)
            .store(in: &disposables)
    }

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
    }
}

private extension Header {

    static var signedIn: Header {
        return Header(id: "0001",
                      title: "Hi Olivia",
                      btnTitle: Constants.btnSignOut,
                      enabled: true,
                      gradient: Styles.defaultGradient)
    }

    static var anonymous: Header {
        return Header(id: "0001",
                      title: "Welcome",
                      btnTitle: Constants.btnLogin,
                      enabled: true,
                      gradient: Styles.defaultGradient)
    }
}
