import UIKit

protocol MainVCDelegate {
    func logout()
}

class MainVC: UIViewController {
    var delegate: MainVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutDidTap))
        self.navigationItem.rightBarButtonItem = item
        self.view.backgroundColor = .blue
    }

    @objc func logoutDidTap() {
        self.delegate?.logout()
    }
}

