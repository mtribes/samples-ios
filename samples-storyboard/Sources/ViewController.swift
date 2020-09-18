//
//  ViewController.swift
//  samples-storyboard
//
//  Created by Leo Wang on 7/9/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var headerBackground: UIView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var signinButton: Button!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var bannerButton: Button!

    var viewModel: ViewModel!

    private let gradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.onSignOut()
        heroImage.kf.indicatorType = .activity
        view.layer.insertSublayer(gradient, at: 0)
    }

    @IBAction func signinBtnTap(_ sender: UIButton) {
        viewModel.buttonTap()
    }

    private func updateUI() {
        welcomeText.text = viewModel.welcomeText
        signinButton.setTitle(viewModel.buttonTitle, for: .normal)
        bannerButton.setTitle(viewModel.bannerMsg, for: .normal)
        heroImage.kf.setImage(with: viewModel.imageUrl)
        applyGradient(for: headerBackground, colors: viewModel.headerColors)
    }

    private func applyGradient(for view: UIView, colors: [UIColor?]) {
        gradient.colors = colors.map { $0?.cgColor }
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = view.frame
        gradient.removeAllAnimations()

        view.backgroundColor = .clear
    }
}

extension ViewController: ViewModelDelegate {
    func didFinishLoading() {
        updateUI()
    }
}

