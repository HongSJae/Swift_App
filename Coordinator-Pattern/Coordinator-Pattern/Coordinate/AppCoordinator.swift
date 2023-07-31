import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private var nc: UINavigationController!
    
    var isLoggedIn = false

    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func start() {
        if self.isLoggedIn {
            showMainVC()
        } else {
            showLoginVC()
        }
    }

    private func showMainVC() {
        let coordinator = MainCoordinator(nc: self.nc)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }

    private func showLoginVC() {
        let coordinator = LoginCoordinator(nc: self.nc)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showMainVC()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func didLoggedout(_ coordinator: MainCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showLoginVC()
    }
}
