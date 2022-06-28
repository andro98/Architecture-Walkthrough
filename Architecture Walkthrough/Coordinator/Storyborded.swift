//
//  Storyborded.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 28/06/2022.
//

import Foundation
import UIKit

protocol Storyborded {
    static func instantiate() -> Self
}

extension Storyborded where Self: UIViewController{
    static func instantiate() -> Self{
        let id = String(describing: self)
        let storyboarded = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboarded.instantiateViewController(withIdentifier: id) as! Self
    }
}
