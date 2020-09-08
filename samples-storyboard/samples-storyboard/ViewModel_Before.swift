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
        let login = user != nil
        welcomeText = login ? user!.name : ""
        buttonTitle = login ? Constants.btnSignOut : Constants.btnLogin
        imageUrl = login ? Constants.imgUrlLogin : Constants.imgUrlSignOut
        bannerMsg = login ? Constants.bannerMember : Constants.bannerVisitor
        headerColors = [Styles.headerColor, Styles.headerColor]
        delegate?.didFinishLoading()
    }
}
