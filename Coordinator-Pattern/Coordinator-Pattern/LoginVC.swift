import UIKit

protocol LoginVCDelegate {
    func login()
}

class LoginVC: UIViewController {
    var delegate: LoginVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        self.view.backgroundColor = .red
    }
    
    @objc func loginButtonDidTap() {
        self.delegate?.login()
    }
}
