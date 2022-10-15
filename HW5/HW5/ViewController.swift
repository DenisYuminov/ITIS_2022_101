import UIKit
let defaults = UserDefaults.standard

class ViewController: UIViewController {
    let loginField = UITextField()
    let passwordField = UITextField()
    let submitButton = UIButton(type: .system)

    @IBOutlet weak var authSteckView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    private func setupStackView() {
        loginField.borderStyle = .roundedRect
        loginField.placeholder = "Login"
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Passwod"
        passwordField.isSecureTextEntry = true
        let stackView = UIStackView(
            arrangedSubviews: [ loginField, passwordField ]
        )
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        submitButton.setTitle("Sign in", for: .normal)
        stackView.addArrangedSubview(submitButton)
        submitButton.addTarget(self, action: #selector(buttonActionAuthorization), for: .touchUpInside)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    @objc func buttonActionAuthorization(sender: UIButton) {
        guard let username = loginField.text else {return}
        guard let password = passwordField.text else {return}
        defaults.set(username, forKey: "Username")
        if username == "Denis" && password == "123"{
            guard let unlockVC = storyboard?.instantiateViewController(withIdentifier: "TabViewController") else {return}
            unlockVC.modalPresentationStyle = .fullScreen
            present(unlockVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Wrong login or password", message: "Please try again!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        loginField.text = nil
        passwordField.text = nil
    }
}
