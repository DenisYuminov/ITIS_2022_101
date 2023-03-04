import Foundation
import UIKit

protocol ProductPresentorDelegate: AnyObject {
    func presentProducts(products: [Product])
}

typealias PresentorDelegate = ProductPresentorDelegate & UIViewController

class CatalogPresentor {
    
    init(
        catalogService: MockCatalogService
    ) {
        self.catalogService = catalogService
    }
    var catalogService = MockCatalogService()
    public var delegate: PresentorDelegate?
    
    public func setViewDelegate(delegate: PresentorDelegate) {
        self.delegate = delegate
    }
    
    
    public func getProducts() {
        let products = catalogService.loadData()
        self.delegate?.presentProducts(products: products)
    }
    @MainActor
      func didSelectProduct(_ product: Product) {
          CatalogCoordinator.shared.showDetails(product: product)
      }
}
