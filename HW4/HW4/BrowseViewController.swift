//
//  BrowseViewController.swift
//  HW4
//
//  Created by macbook Denis on 10/8/22.
//

import UIKit

class BrowseViewController: ViewController {
    var name: String = "First vc"
    
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var browseCatalogButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageLabel.text = "Catalog, Page: \(String(describing: navigationController!.viewControllers.count))"
    }
    
    
    @IBAction func browseButtonAction(_ sender: Any) {
        let anotherVC: BrowseViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "BrowseViewController")
        if name == "First vc" {
            anotherVC.name = "Second vc"
            navigationController?.pushViewController(anotherVC, animated: true)
        }else {
            let navigationController = UINavigationController(
                rootViewController: anotherVC
            )
            present(navigationController, animated: true)
        }
    }
}
