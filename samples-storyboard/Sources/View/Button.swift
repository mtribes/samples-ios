import UIKit

@IBDesignable
class Button: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        UIView.setAnimationsEnabled(false)
        super.setTitle(title, for: state)
        layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
    }
}
