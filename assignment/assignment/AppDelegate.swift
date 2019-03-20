//
//  AppDelegate.swift
//  assignment
//
//  Created by Chris Chen on 2019/3/19.
//  Copyright © 2019 Dev4App. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupApplicationViewControllers()
        return true
    }
    
    func setupApplicationViewControllers() {
        
        let mainViewController = MainViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}

