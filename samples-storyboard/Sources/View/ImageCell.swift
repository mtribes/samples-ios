//
//  ImageCell.swift
//  samples-storyboard
//
//  Created by Leo Wang on 2/10/20.
//

import UIKit
import Kingfisher

class ImageCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var heroImage: UIImageView!

    func configure(_ item: BodyItem) {
        guard item.dataType == .url else { return }
        let url = item.data as? URL
        heroImage.kf.indicatorType = .activity
        heroImage.kf.setImage(with: url)
    }
}
