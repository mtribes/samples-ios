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
        let login = user != nil
        welcomeText = login ? user!.name : ""
        buttonTitle = login ? Constants.btnSignOut : Constants.btnLogin

        let imageUrl = login ? Constants.imgUrlLogin : Constants.imgUrlSignOut
        let bannerMsg = login ? Constants.bannerMember : Constants.bannerVisitor
        body = [
            BodyItem(id: "image", dataType: .url, data: imageUrl),
            BodyItem(id: "banner", dataType: .text, data: bannerMsg)
        ]
    }
}
