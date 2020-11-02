import UIKit
import Kingfisher

class ImageCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var heroImage: UIImageView!

    func configure(_ item: BodyItem) {
        guard item.dataType == .hero else { return }
        let url = item.data as? URL
        heroImage.kf.indicatorType = .activity
        heroImage.kf.setImage(with: url)
    }
}
