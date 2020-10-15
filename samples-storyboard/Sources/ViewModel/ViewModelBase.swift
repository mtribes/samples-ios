//
//  ViewModelBase.swift
//  samples-storyboard
//
//  Created by Leo Wang on 7/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit

protocol ViewModelDelegate: AnyObject {
    func didFinishLoading()
}

class ViewModel {

    var welcomeText: String = ""
    var buttonTitle: String = ""
    var body: [BodyItem] = []
    var headerColors: [UIColor?] = [Styles.headerColor, Styles.headerColor]

    weak var delegate: ViewModelDelegate?

    func buttonTap() {}
    func onLogin() {}
    func onSignOut() {}
    func observeSession() {}
}
