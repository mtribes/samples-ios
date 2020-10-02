//
//  ViewModelBase.swift
//  samples-swiftui
//
//  Created by Leo Wang on 3/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {

    @Published var welcomeText: String = ""
    @Published var buttonTitle: String = ""
    @Published var body: [BodyItem] = []
    @Published var headerGradient = Gradient(colors: [Styles.headerColor])

    func buttonTap() {}
    func onLogin() {}
    func onSignOut() {}
}
