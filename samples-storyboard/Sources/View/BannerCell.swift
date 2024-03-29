import UIKit

class BannerCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var bannerButton: Button!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Styles.bannerColor
    }

    func configure(_ item: BodyItem) {
        guard item.dataType == .banner,
              let text = item.data as? String
        else { return }
        bannerButton.setTitle(text, for: .normal)
    }
}
