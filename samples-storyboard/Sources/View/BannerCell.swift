//
//  BannerCell.swift
//  samples-storyboard
//
//  Created by Leo Wang on 2/10/20.
//

import UIKit

class BannerCell: UITableViewCell, ReusableCell, ResizableCell {

    @IBOutlet weak var bannerButton: Button!

    var height: CGFloat {
        return 100
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Styles.bannerColor
    }

    func configure(_ item: BodyItem) {
        guard item.dataType == .text,
              let text = item.data as? String
        else { return }
        bannerButton.setTitle(text, for: .normal)
    }
}
