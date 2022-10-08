//
//  ExitViewController.swift
//  HW4
//
//  Created by macbook Denis on 10/7/22.
//

import UIKit

class ExitViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Hello, \(defaults.string(forKey: "Username")!)"
    }
    

    @IBAction func signOutButtonAction(_ sender: Any) {

        dismiss(animated: true,completion: nil)

    }
    

}
