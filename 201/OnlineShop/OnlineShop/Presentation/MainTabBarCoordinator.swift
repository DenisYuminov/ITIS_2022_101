

import UIKit

class MainTabBarCoordinator {
    weak var tabBarController: UITabBarController?
    weak var window: UIWindow?

    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        self.tabBarController = tabBarController
        tabBarController.viewControllers = [
            shopping(),
            profile(),
        ]
        return tabBarController
    }

    private let storyboard: UIStoryboard = .init(name: "Main", bundle: nil)

    private func shopping() -> UIViewController {
        return FlowCoordinator.shared.start()
    }

    private func profile() -> UIViewController {
        let controller: ProfileViewController = storyboard.instantiateViewController(identifier: "ProfileViewController")
        controller.tabBarItem = .init(
            title: "Profile",
            image: .init(systemName: "person.circle"),
            selectedImage: .init(systemName: "person.circle.fill")
        )
        return controller
    }
}
