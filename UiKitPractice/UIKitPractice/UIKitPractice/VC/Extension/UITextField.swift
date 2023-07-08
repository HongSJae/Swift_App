import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    func setTextField(forTextField: UITextField, placeholder: String) {
        forTextField.layer.borderWidth = 1
        forTextField.layer.cornerRadius = 10
        forTextField.layer.borderColor =  CGColor.init(gray: 0.3, alpha: 1)
        forTextField.placeholder = placeholder
        forTextField.textColor = .systemGray6
    }
    func setNumberTextField(forTextField: UITextField) {
        forTextField.layer.borderWidth = 1
        forTextField.layer.cornerRadius = 10
        forTextField.layer.borderColor =  CGColor.init(gray: 1, alpha: 1)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
        forTextField.keyboardType = .numberPad
    }
    func setTitleTextField(forTextField: UITextField, placeholderText: String) {
        forTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [
            .foregroundColor: .init(),
            .font: UIFont.boldSystemFont(ofSize: 22.0)
        ])
        forTextField.layer.borderWidth = 0

    }
}
