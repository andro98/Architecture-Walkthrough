//
//  PageOneViewController.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 28/06/2022.
//

import UIKit

class PageOneViewController: UIViewController, Storyborded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstScreenTapped(_ sender: Any) {
        coordinator?.viewTwoWay()
    }
    
    @IBAction func secondScreenTapped(_ sender: Any) {
        coordinator?.pageTwo()
    }
}
