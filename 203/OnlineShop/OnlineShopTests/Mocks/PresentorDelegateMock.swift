import Foundation
@testable import OnlineShop

class PresentorDelegateMock: PresentorDelegate {
    
    var presentProductsCalled = false
    var presentedProducts: [Product]?
    
    func presentProducts(products: [Product]) {
        presentProductsCalled = true
        presentedProducts = products
    }
}
