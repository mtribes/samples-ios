import SwiftUI
import Combine
import Mtribes

class ViewModel_After: ViewModel {

    @Published private var user: User?

    private var signedIn: Bool {
        return !Mtribes.session.anonymous
    }

    private let fakeUser = User(
        id: "2id2f459d2s5",
        name: "Olivia",
        subscription: "gold"
    )

    private var disposables = Set<AnyCancellable>()

    override init() {
        super.init()
        Mtribes.client.sessionLock = false
        $user.receive(on: DispatchQueue.main)
            .debounce(for: 0.01, scheduler: DispatchQueue.main)
            .sink { [weak self] user in
                if Mtribes.session.ready {
                    self?.loginStatusChange(user)
                }
            }
            .store(in: &disposables)
        subscribeChange()
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

    private func subscribeChange() {
        Mtribes.session.changed()
            .map { _ in Mtribes.session.anonymous ? nil : self.fakeUser }
            .assign(to: \.user, on: self)
            .store(in: &disposables)
    }

    private func loginStatusChange(_ user: User?) {
        let home = Mtribes.collections.homepage

        header = getHeader(for: home.header)
        body = getBodyItems(for: home.body)
    }

    private func getHeader(for exp: HeaderExperience) -> Header {
        let bgColor = exp.data.backgroundColor
        let gradientColor = exp.data.gradientColor
        let gradient: Gradient
        if let hex = bgColor?.value, let gradientHex = gradientColor?.value {
            let colors = [
                Color(hex: hex, opacity: bgColor?.opacity),
                Color(hex: gradientHex, opacity: gradientColor?.opacity)
            ]
            gradient = Gradient(colors: colors)
        } else {
            gradient = Gradient(colors: [Styles.headerColor])
        }
        return Header(id: exp.id,
                      title: signedIn ? "Hi \(fakeUser.name)" : "Welcome",
                      btnTitle: signedIn ? Constants.btnSignOut : Constants.btnLogin,
                      enabled: exp.enabled,
                      gradient: gradient)
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
