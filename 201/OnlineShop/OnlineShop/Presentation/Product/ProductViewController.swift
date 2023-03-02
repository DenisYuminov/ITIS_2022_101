import UIKit

class ProductViewController: UIViewController {
    var product: Product?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let descript: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
    }

    func setup() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descript,costLabel])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
//            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -300)
        ])
    }
     
    func configureUI(){
    
        titleLabel.text = product?.name
        costLabel.text = "\(product?.cost ?? 0)$"
        descript.text = product?.description
        
    }
}
