//
//  AppDelegate.swift
//  Architecture Walkthrough
//
//  Created by Andrew Maher on 23/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let nv = UINavigationController()
        coordinator = MainCoordinator(navigationController: nv)
        coordinator?.start()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nv
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
}

