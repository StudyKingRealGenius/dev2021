//
//  AppDelegate.swift
//  GrammarTest
//
//  Created by 권해진 on 2021/02/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var navigationController: UINavigationController?
    
    var mainViewController: MainViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let introVC = IntroViewController.init(nibName: "IntroViewController", bundle: nil)
        navigationController = UINavigationController.init(rootViewController: introVC)
        navigationController?.isNavigationBarHidden = true
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    static var realDelegate: AppDelegate?
    
    static func applicationDelegate() -> AppDelegate {
        if Thread.isMainThread {
            return UIApplication.shared.delegate as! AppDelegate
        }
        
        let dg = DispatchGroup()
        dg.enter()
        DispatchQueue.main.async {
            realDelegate = UIApplication.shared.delegate as? AppDelegate
            dg.leave()
        }
        dg.wait()
        return realDelegate!
    }
    
    static func applicationMainView() -> MainViewController {
        if applicationDelegate().mainViewController == nil {
            applicationDelegate().mainViewController = MainViewController.init(nibName: "MainViewController", bundle: nil)
        }
        return applicationDelegate().mainViewController!
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

