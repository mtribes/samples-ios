//
//  ContentView.swift
//  samples-swiftui
//
//  Created by Leo Wang on 2/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            header
            Spacer().frame(height: 80)
            BodyImage(url: viewModel.imageUrl)
            Spacer().frame(height: 100)
            Banner(title: viewModel.bannerMsg)
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
struct BodyImage: View {

    let url: URL?

    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 50)
    }
}

// MARK:- Banner
struct Banner: View {

    let title: String

    var body: some View {
        VStack {
            PrimaryButton(
                action: {},
                title: title,
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
                .padding()
                .frame(minWidth: 88, minHeight: 32, maxHeight: 32)
        }
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(borderColor, lineWidth: 1)
        )
        .background(backgroundColor)
    }
}
