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
        header = getHeader(signedIn: signedIn)
        body = getBody(signedIn: signedIn)

        delegate?.didFinishLoading()
    }

    private func getHeader(signedIn: Bool) -> Header {
        if signedIn {
            return FakeData.SignedIn.header
        } else {
            return FakeData.Anonymous.header
        }
    }

    private func getBody(signedIn: Bool) -> [BodyItem] {
        if signedIn {
            return FakeData.SignedIn.body
        } else {
            return FakeData.Anonymous.body
        }
    }
}
