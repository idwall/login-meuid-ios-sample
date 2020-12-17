//
//  AppDelegate.swift
//  SampleLoginMeuID
//
//  Created by Idwall on 26/11/20.
//  Copyright © 2020 Idwall. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let successStoryBoard = UIStoryboard(name: "Success", bundle: Bundle.main)
        guard let viewController = successStoryBoard.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else { return true }
        self.window?.rootViewController?.present(viewController, animated: true, completion: nil)
        viewController.setParametersFromURL(url: url)
        return true
    }
}
