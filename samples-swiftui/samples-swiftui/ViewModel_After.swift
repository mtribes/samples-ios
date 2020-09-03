//
//  ViewModel.swift
//  samples-swiftui
//
//  Created by Leo Wang on 3/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import SwiftUI
import Combine
import Mtribes

class ViewModel_After: ViewModel {

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
        let options = StartOptions(
            userId: fakeUser.id,
            fields: ["subscription": fakeUser.subscription]
        )
        Mtribes.session.start(options: options) { [weak self] _ in
            self?.user = self?.fakeUser
        }
    }

    override func onSignOut() {
        Mtribes.session.start() { [weak self] _ in
            self?.user = nil
        }
    }

    private func loginStatusChange(_ user: User?) {
        let login = user != nil
        welcomeText = login ? "Welcome \(user!.name)" : ""
        buttonTitle = login ? Constants.btnSignOut : Constants.btnLogin

        let home = Mtribes.collections.homepage

        let bgColor = home.header.data.bgColor
        if let hex = bgColor?.value {
            headerColor = Color(hex: hex, opacity: bgColor?.opacity)
        } else {
            headerColor = Styles.headerColor
        }

        home.body.forEach { exp in
            switch exp {
            case let hero as HomepageBodySection.Supported.Hero:
                imageUrl = hero.data.source
            case let banner as HomepageBodySection.Supported.Banner:
                bannerMsg = banner.data.label ?? ""
            default:
                break
            }
        }
    }
}
