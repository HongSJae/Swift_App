import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator, LoginVCDelegate {
    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?
    
    private var nc: UINavigationController!
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func start() {
        let vc = LoginVC()
        vc.view.backgroundColor = .red
        self.nc.viewControllers = [vc]
        vc.delegate = self
    }

    func login() {
        self.delegate?.didLoggedIn(self)
    }
}
