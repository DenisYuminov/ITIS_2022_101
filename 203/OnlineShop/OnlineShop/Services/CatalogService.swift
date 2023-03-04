import Foundation

protocol CatalogService {
    var mockedData: [Product]? { get }

    func loadData() -> [Product]
}

class MockCatalogService: CatalogService {
    
    var mockedData: [Product]?

    func loadData() -> [Product]{
        
        mockedData = [
        Product(name: "БРАЗИЛИЯ СЕРРАДО", cost: 100, description: "zxvlcjlgds"),
        Product(name: "НАТТИ", cost: 450, description: "dfsadfas"),
        Product(name: "КЭНДИ", cost: 300, description: "ocheny"),
        Product(name: "БЭРРИ", cost: 400, description: "asdasdas"),
        Product(name: "БАРИСТА", cost: 500, description: "123213"),
        Product(name: "БРАЗИЛИЯ МОЖИАНА", cost: 590, description: "213123"),
        Product(name: "ЭФИОПИЯ ГУДЖИ", cost: 400, description: "dasdasdas"),
        Product(name: "Капучино", cost: 300, description: "dsadasdasdasf")
        ]
        return mockedData ?? []
    }
    
    
}

