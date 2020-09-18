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
        VStack {
            header
            Spacer().frame(height: 80)
            image
            Spacer().frame(height: 100)
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
            HStack(spacing: 16) {
                Image("logo").resizable()
                    .frame(width: 32, height: 32)
                Text(viewModel.welcomeText)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
            }
            Spacer()
            PrimaryButton(
                action: viewModel.buttonTap,
                title: viewModel.buttonTitle,
                backgroundColor: .clear)
            Spacer().frame(width: 20)
        }
        .frame(height: 56)
        .background(LinearGradient(gradient: viewModel.headerGradient, startPoint: .leading, endPoint: .trailing))
    }
}

// MARK:- Image
extension ContentView {

    var image: some View {
        return ZStack {
            if viewModel.imageUrl != nil {
                URLImage(viewModel.imageUrl!) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 50)
                }
            } else {
                Text("")
            }
        }
    }
}

// MARK:- Banner
extension ContentView {

    var banner: some View {
        VStack {
            PrimaryButton(
                action: {},
                title: viewModel.bannerMsg,
                backgroundColor: Styles.primaryBackground,
                borderColor: .clear)
                .cornerRadius(4)
        }
            .frame(maxWidth: .infinity, minHeight: 100, alignment: .center)
            .background(Styles.bannerColor)
    }
}

struct PrimaryButton: View {

    let action: () -> ()
    let title: String
    let backgroundColor: Color
    var borderColor: Color = .white

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 88, height: 32)
        }
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(borderColor, lineWidth: 1)
        )
        .background(backgroundColor)
    }
}
