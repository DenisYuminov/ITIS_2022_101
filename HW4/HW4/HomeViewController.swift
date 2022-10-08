//
//  HomeViewController.swift
//  HW4
//
//  Created by macbook Denis on 10/7/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var browseButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Hello, \(defaults.string(forKey: "Username")!)"

    }
    
    @IBAction func imageButtonDidTap(_ sender: Any) {
        guard let unlockVC = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") else {return}
     present(unlockVC, animated: true)
    }

    @IBAction func browseButtonDidTap(_ sender: Any) {
//        guard let browseVC = storyboard?.instantiateViewController(withIdentifier: "BrowseViewController") else {return}
//     present(browseVC, animated: true)
        guard let browseVC = storyboard?.instantiateViewController(withIdentifier: "BrowseViewController") else {return}
        navigationController?.pushViewController(browseVC, animated: true)
        
    }
}
