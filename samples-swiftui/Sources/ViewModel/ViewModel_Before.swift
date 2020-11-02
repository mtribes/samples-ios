import Foundation
import Combine

class ViewModel_Before: ViewModel {

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
        user = fakeUser
    }

    override func onSignOut() {
        user = nil
    }

    private func loginStatusChange(_ user: User?) {
        let signedIn = user != nil
        header = getHeader(signedIn: signedIn)
        body = getBody(signedIn: signedIn)
    }

    private func getHeader(signedIn: Bool) -> Header {
        if signedIn {
            return FakeData.SignedIn.header
        } else {
            return FakeData.Anonymous.header
        }
    }

    private func getBody(signedIn: Bool) -> [BodyItem] {
        if signedIn {
            return FakeData.SignedIn.body
        } else {
            return FakeData.Anonymous.body
        }
    }
}
