//
//  MainCoordinator.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 28/06/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator{
    var child = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PageOneViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
        
    func pageTwo(){
        let vc = PageTwoViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func viewTwoWay(){
        let vc = ViewControllerWithMVVM_OneWayBinding.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
