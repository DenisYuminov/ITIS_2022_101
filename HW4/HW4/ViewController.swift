//
//  ViewController.swift
//  HW4
//
//  Created by macbook Denis on 10/7/22.
//

import UIKit
let defaults = UserDefaults.standard


class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var authButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        
    }
    
   
    
    @IBAction func authButtonDidTap(_ sender: Any) {
        guard let username = usernameText.text else {return}
        guard let password = passwordField.text else {return}
        defaults.set(username, forKey: "Username")
        if username == "denis" && password == "123"{
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
        
        usernameText.text = nil
        passwordField.text = nil
    }
    

}
    

