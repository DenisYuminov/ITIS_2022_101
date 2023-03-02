import UIKit

class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductPresentorDelegate {

    

    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private var products = [Product]()
    let presentor = CatalogPresentor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products"
        
        presentor.setViewDelegate(delegate: self)
        presentor.getProducts()
        setup()
    }

    func setup(){
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.reloadData()
        tableView.delegate = self
    }
    
    // table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var configuration = UIListContentConfiguration.cell()
        configuration.text = products[indexPath.row].name
        configuration.image = UIImage(systemName: "cup.and.saucer" )
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = self.products[indexPath.row]
        presentor.didSelectProduct(product)
    }
    
    // Presentor
    func presentProducts(products: [Product]) {
        self.products = products
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
