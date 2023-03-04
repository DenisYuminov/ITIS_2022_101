import Foundation
import UIKit

protocol Coordinator {
    
    func start() -> UIViewController
    
}

class FlowCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static let shared: FlowCoordinator = .init()
    
    func start() -> UIViewController {
        let controller: CatalogViewController = storyboard.instantiateViewController(identifier: "CatalogViewController")
        controller.tabBarItem = .init(
            title: "Catalog",
            image: .init(systemName: "cart"),
            selectedImage: .init(systemName: "cart.fill")
        )
        navigationController = UINavigationController(rootViewController: controller)
        return navigationController!
    }
    
    func showDetails(product: Product) {
        let productVC: ProductViewController = storyboard.instantiateViewController(identifier: "ProductViewController")
        productVC.product = product
        navigationController?.pushViewController(productVC, animated: true)
        
    }
    
}