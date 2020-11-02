import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        Mtribes.client.sessionLock = false // enable live updates

        if let viewController = window?.rootViewController as? ViewController {
//            viewController.viewModel = ViewModel_Before()
            viewController.viewModel = ViewModel_After()
        }
    }
}

