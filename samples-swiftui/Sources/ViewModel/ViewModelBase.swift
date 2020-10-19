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

    @Published var header: Header = Header()
    @Published var body: [BodyItem] = []

    func buttonTap() {}
    func onLogin() {}
    func onSignOut() {}
}
