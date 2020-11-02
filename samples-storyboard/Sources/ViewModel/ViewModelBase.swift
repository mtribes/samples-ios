import UIKit

protocol ViewModelDelegate: AnyObject {
    func didFinishLoading()
}

class ViewModel {

    var header: Header = Header()
    var body: [BodyItem] = []

    weak var delegate: ViewModelDelegate?

    func buttonTap() {}
    func onLogin() {}
    func onSignOut() {}
    func observeSession() {}
}
