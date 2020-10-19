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

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var signinButton: Button!
    @IBOutlet weak var tableView: UITableView!

    var viewModel: ViewModel!

    private let gradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.onSignOut()
        viewModel.observeSession()
        configureTableView()
        view.layer.insertSublayer(gradient, at: 0)
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.contentInset = .zero
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: ImageCell.identifier)
        tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: BannerCell.identifier)
    }

    @IBAction func signinBtnTap(_ sender: UIButton) {
        viewModel.buttonTap()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.applyGradient(for: self.headerView, colors: self.viewModel.header.colors)
        }

    }

    private func updateUI() {
        headerView.isHidden = !viewModel.header.enabled
        welcomeText.text = viewModel.header.title
        signinButton.setTitle(viewModel.header.btnTitle, for: .normal)
        applyGradient(for: headerView, colors: viewModel.header.colors)
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
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.body[indexPath.section]
        switch item.dataType {
        case .banner:
            return 100
        case .hero:
            let safeArea = view.safeAreaInsets
            let width = view.bounds.width - safeArea.left - safeArea.right
            let aspectRatio: CGFloat = 16 / 9
            return width / aspectRatio
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.body.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.body[indexPath.section]
        switch item.dataType {
        case .banner:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifier, for: indexPath) as! BannerCell
            cell.configure(item)
            return cell
        case .hero:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            cell.configure(item)
            return cell
        }
    }
}

protocol ReusableCell {
    static var identifier: String { get }
}
extension ReusableCell {
    static var identifier: String {
        String(describing: self)
    }
}
