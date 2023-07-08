import UIKit
import SnapKit
import Then

extension UIButton {
    func setComponent(title: String, font: UIFont, image: UIImage?, color: UIColor) {
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.setImage(image, for: .normal)
        self.tintColor = color
    }
    func imagePadding(padding: CGFloat) {
        var configuration = UIButton.Configuration.plain()
        configuration.imagePadding = padding
        self.configuration = configuration
    }
    func setUnderline(start: Int) {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: start, length: title.count-start)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    func setAuthButton(title: String) {
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray2
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    func setWriteButton(title: String, radius: Int, fontSize: Int) {
        self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .semibold)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = CGFloat(radius)
        self.backgroundColor = .systemGray4
        self.layer.borderWidth = 1
        self.layer.borderColor = .init(gray: 1, alpha: 1)
    }
}
