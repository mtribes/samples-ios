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

    private var signedIn: Bool {
        return !Mtribes.session.anonymous
    }

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

    override func observeSession() {
        Mtribes.session.changedWithCallback(owner: self) { [weak self] event in
            if event.status == .primed {
                self?.user = Mtribes.session.anonymous ? nil : self?.fakeUser
            }
        }
    }

    private func loginStatusChange(_ user: User?) {
        let home = Mtribes.collections.homepage

        header = getHeader(for: home.header)
        body = getBodyItems(for: home.body)
        delegate?.didFinishLoading()
    }

    private func getHeader(for exp: HeaderExperience) -> Header {
        let bgColor = exp.data.backgroundColor
        let gradientColor = exp.data.gradientColor
        let colors = [
            bgColor?.uiColor,
            gradientColor?.uiColor
        ]
        return Header(id: exp.id,
                      title: signedIn ? "Hi \(fakeUser.name)" : "Welcome",
                      btnTitle: signedIn ? Constants.btnSignOut : Constants.btnLogin,
                      enabled: exp.enabled,
                      colors: colors)
    }

    private func getBodyItems(for section: HomepageBodySection) -> [BodyItem] {
        section.compactMap { exp in
            guard exp.enabled else { return nil }
            switch exp {
            case let hero as HomepageBodySection.Supported.Hero:
                return BodyItem(id: exp.id,
                                dataType: .hero,
                                data: hero.data.source)
            case let banner as HomepageBodySection.Supported.Banner:
                return BodyItem(id: exp.id,
                                dataType: .banner,
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
