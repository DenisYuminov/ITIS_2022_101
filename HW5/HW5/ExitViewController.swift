import UIKit

class ExitViewController: UIViewController {
    let textLabel =  UILabel()
    let signOutButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    private func setupStackView() {

        let stackView = UIStackView(
            arrangedSubviews: [ textLabel, signOutButton ]
        )
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        textLabel.text = "Goodbye, \(defaults.string(forKey: "Username")!)"
        signOutButton.setTitle("Sign out", for: .normal)
        stackView.addArrangedSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(signOutButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    @objc func signOutButtonAction(sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
}
