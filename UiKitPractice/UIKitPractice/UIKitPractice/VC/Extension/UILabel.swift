import UIKit

extension UILabel {
    func setAuthLabel(text: String) {
        self.text = text
        self.textColor = .gray
        self.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    func setWriteLabel(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}
