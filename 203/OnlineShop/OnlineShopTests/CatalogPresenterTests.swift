import XCTest
@testable import OnlineShop



final class CatalogPresenterTests: XCTestCase {
    
    var catalogService: MockCatalogService!
    var presenter: CatalogPresentor!
    var delegateMock: PresentorDelegateMock!
    
    @MainActor
    override func setUp() {
        catalogService = MockCatalogService()
        presenter = CatalogPresentor(catalogService: catalogService)
        delegateMock = PresentorDelegateMock()
        presenter.setViewDelegate(delegate: delegateMock)
    }
    
    
    
    func testGetProducts() {
        let expectedProducts: [Product] = [
            Product(name: "БРАЗИЛИЯ СЕРРАДО", cost: 100, description: "zxvlcjlgds"),
            Product(name: "НАТТИ", cost: 450, description: "dfsadfas"),
            Product(name: "КЭНДИ", cost: 300, description: "ocheny"),
            Product(name: "БЭРРИ", cost: 400, description: "asdasdas"),
            Product(name: "БАРИСТА", cost: 500, description: "123213"),
            Product(name: "БРАЗИЛИЯ МОЖИАНА", cost: 590, description: "213123"),
            Product(name: "ЭФИОПИЯ ГУДЖИ", cost: 400, description: "dasdasdas"),
            Product(name: "Капучино", cost: 300, description: "dsadasdasdasf")
        ]
        presenter.catalogService.mockedData = expectedProducts
        presenter.getProducts()
        
        XCTAssertTrue(delegateMock.presentProductsCalled)
        XCTAssertEqual(expectedProducts, delegateMock.presentedProducts)

    }
    
    

    func testDidSelectProduct() async {
        
        let product = Product(name: "БРАЗИЛИЯ СЕРРАДО", cost: 100, description: "zxvlcjlgds")
           
        await presenter.didSelectProduct(product)
        
        XCTAssertTrue(CatalogCoordinator.shared.showDetailsCalled)
//        XCTAssertEqual(CatalogCoordinator.shared.showDetails(product: product), product)
       }
    
    func testSetViewDelegate() {
           let mockDelegate = PresentorDelegateMock()
           
           presenter.setViewDelegate(delegate: mockDelegate)
           
           XCTAssertTrue(presenter.delegate === mockDelegate)
       }
}
