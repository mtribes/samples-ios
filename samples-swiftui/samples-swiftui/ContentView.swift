//
//  ContentView.swift
//  samples-swiftui
//
//  Created by Leo Wang on 2/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import SwiftUI
import URLImage

class ViewModel: ObservableObject {

    @Published var welcomeText: String = ""
    @Published var buttonTitle: String = ""
    @Published var imageUrl = Constants.imgUrlSignOut
    @Published var bannerMsg: String = ""

    func buttonTap() {}
    func onLogin() {}
    func onSignOut() {}
}

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 100) {
            header
            image
            banner
            Spacer()
        }
    }
}

// MARK:- Header
extension ContentView {

    var header: some View {
        HStack {
            Spacer().frame(width: 20)
            Text(viewModel.welcomeText)
            Spacer()
            Button(action: {
                self.viewModel.buttonTap()
            }) {
                Text(viewModel.buttonTitle)
                    .foregroundColor(.black)
                    .frame(width: 90, height: 32)
            }
            .background(Color.white)
            Spacer().frame(width: 20)
        }
        .frame(height: 80)
        .background(Styles.headerColor)
    }
}

// MARK:- Image
extension ContentView {

    var image: some View {
        URLImage(viewModel.imageUrl) { proxy in
            proxy.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding()
        }
        .frame(height: 50)
    }
}

// MARK:- Banner
extension ContentView {

    var banner: some View {
        Text(viewModel.bannerMsg)
            .frame(maxWidth: .infinity, minHeight: 100, alignment: .center)
            .font(.system(size: 28))
            .background(Styles.bannerColor)
    }
}
