import UIKit

class HomeViewController: UIViewController {
    let browseButton = UIButton(type: .system)
    let textLabel = UILabel()
    let imageButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    private func setupStackView() {
        let stackView = UIStackView(
            arrangedSubviews: [ textLabel, browseButton, imageButton ]
        )
        textLabel.text = "Hello, \(defaults.string(forKey: "Username")!)"
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        browseButton.setTitle("Browse catalog", for: .normal)
        browseButton.backgroundColor = .blue
        browseButton.tintColor = .white
        browseButton.layer.cornerRadius = 10
        stackView.addArrangedSubview(browseButton)
        browseButton.addTarget(self, action: #selector(browseButtonDidTap), for: .touchUpInside)
        imageButton.backgroundColor = .blue
        imageButton.tintColor = .white
        imageButton.layer.cornerRadius = 10
        imageButton.setTitle("Animal image", for: .normal)
        stackView.addArrangedSubview(imageButton)
        imageButton.addTarget(self, action: #selector(imageButtonDidTap), for: .touchUpInside)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 115),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -115),
            stackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
        ])
    }
    
    @objc func imageButtonDidTap(_ sender: UIButton) {
        guard let unlockVC = storyboard?.instantiateViewController(withIdentifier: "ImageeViewController") else {return}
     present(unlockVC, animated: true)
    }

    @objc func browseButtonDidTap(_ sender: UIButton) {
        guard let browseVC = storyboard?.instantiateViewController(withIdentifier: "BrowseViewController") else {return}
        navigationController?.pushViewController(browseVC, animated: true)
    }
}
