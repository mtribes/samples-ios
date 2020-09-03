//
//  ContentView.swift
//  samples-swiftui
//
//  Created by Leo Wang on 2/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import SwiftUI
import URLImage

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
        .background(viewModel.headerColor)
    }
}

// MARK:- Image
extension ContentView {

    var image: some View {
        if let url = viewModel.imageUrl {
            return AnyView(URLImage(url) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding()
            }
            .frame(height: 50))
        } else {
            return AnyView(Text(""))
        }
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
