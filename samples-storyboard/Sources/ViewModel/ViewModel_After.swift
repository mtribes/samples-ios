//
//  ViewModel_After.swift
//  samples-storyboard
//
//  Created by Leo Wang on 7/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit
import Mtribes

class ViewModel_After: ViewModel {

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

    override init() {
        super.init()
        Mtribes.client.sessionLock = false
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
        Mtribes.session.startWithCallback(options: options) { [weak self] _ in
            self?.user = self?.fakeUser
        }
    }

    override func onSignOut() {
        Mtribes.session.startWithCallback() { [weak self] result in
            self?.user = nil
        }
    }

    private func loginStatusChange(_ user: User?) {
        let login = user != nil
        welcomeText = login ? user!.name : ""
        buttonTitle = login ? Constants.btnSignOut : Constants.btnLogin

        let home = Mtribes.collections.homepage

        let bgColor = home.header.data.backgroundColor
        let gradientColor = home.header.data.gradientColor
        headerColors = [
            bgColor?.uiColor,
            gradientColor?.uiColor
        ]

        body = getBodyItems(for: home.body)
        delegate?.didFinishLoading()
    }

    private func getBodyItems(for section: HomepageBodySection) -> [BodyItem] {
        section.compactMap { exp in
            switch exp {
            case let hero as HomepageBodySection.Supported.Hero:
                return BodyItem(id: exp.id,
                                dataType: .url,
                                data: hero.data.source)
            case let banner as HomepageBodySection.Supported.Banner:
                return BodyItem(id: exp.id,
                                dataType: .text,
                                data: banner.data.label)
            default:
                return nil
            }
        }
    }
}

extension MTColor {

    var uiColor: UIColor? {
        let alpha: CGFloat = CGFloat(opacity ?? 1)
        guard let hex = value else { return nil }
        return UIColor(hex: hex, alpha: alpha)
    }
}