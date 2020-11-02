import Foundation
import SwiftUI

class ViewModel: ObservableObject {

    @Published var header: Header = Header()
    @Published var body: [BodyItem] = []

    func buttonTap() {}
    func onLogin() {}
    func onSignOut() {}
}
