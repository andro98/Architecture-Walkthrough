//
//  Coordinator.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 28/06/2022.
//

import Foundation
import UIKit

protocol Coordinator{
    var child: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
