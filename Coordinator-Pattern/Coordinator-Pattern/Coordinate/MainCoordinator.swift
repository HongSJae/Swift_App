import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedout(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainVCDelegate {
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    
    private let nc: UINavigationController!
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    func start() {
        let vc = MainVC()
        vc.delegate = self
        self.nc.viewControllers = [vc]
    }
    func logout() {
        self.delegate?.didLoggedout(self)
    }
}
