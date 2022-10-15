import UIKit

class BrowseViewController: UIViewController {
    let pageLabel = UILabel()
    let browseButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    private func setupStackView() {
        let stackView = UIStackView(
        arrangedSubviews: [ pageLabel, browseButton ]
        )
        pageLabel.text = "Catalog, Page: \(Int((navigationController?.viewControllers.count)!))"
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        browseButton.setTitle("Browse Catalog", for: .normal)
        browseButton.backgroundColor = .blue
        browseButton.tintColor = .white
        browseButton.layer.cornerRadius = 10
        stackView.addArrangedSubview(browseButton)
        browseButton.addTarget(self, action: #selector(browseButtonAction), for: .touchUpInside)
                NSLayoutConstraint.activate([
                    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
                    stackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
                ])
        }
        @objc func browseButtonAction(sender: UIButton) {
            let anotherVC: BrowseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BrowseViewController") as! BrowseViewController
                     navigationController?.pushViewController(anotherVC, animated: true)
    }
}

