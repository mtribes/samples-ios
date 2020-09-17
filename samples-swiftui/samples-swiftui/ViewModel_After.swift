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
            .sink { [weak self] user in
                self?.loginStatusChange(user)
            }
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
        Mtribes.session.start(options: options)
            .map { _ in self.fakeUser }
            .assign(to: \.user, on: self)
            .store(in: &disposables)
    }

    override func onSignOut() {
        Mtribes.session.start()
            .map { _ in nil }
            .assign(to: \.user, on: self)
            .store(in: &disposables)
    }

    private func loginStatusChange(_ user: User?) {
        let login = user != nil
        welcomeText = login ? user!.name : ""
        buttonTitle = login ? Constants.btnSignOut : Constants.btnLogin

        let home = Mtribes.collections.homepage

        let bgColor = home.header.data.backgroundColor
        let gradientColor = home.header.data.gradientColor
        if let hex = bgColor?.value, let gradientHex = gradientColor?.value {
            let colors = [
                Color(hex: hex, opacity: bgColor?.opacity),
                Color(hex: gradientHex, opacity: gradientColor?.opacity)
            ]
            headerGradient = Gradient(colors: colors)
        } else {
            headerGradient = Gradient(colors: [Styles.headerColor])
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
