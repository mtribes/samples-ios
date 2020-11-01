//
//  SceneDelegate.swift
//  samples-swiftui
//
//  Created by Leo Wang on 2/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        let viewModel = ViewModel_Before()
        let viewModel = ViewModel_After()

        viewModel.onSignOut()
        let contentView = ContentView(viewModel: viewModel)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

