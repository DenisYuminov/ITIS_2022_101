import Foundation

struct Product {
    var name: String
    var cost: Int
    var description: String
    init(name: String, cost: Int, description: String) {
        self.name = name
        self.cost = cost
        self.description = description
    }
}
