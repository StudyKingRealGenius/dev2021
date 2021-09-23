//
//  AppDelegate.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/05.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    /**
     * @brief navigationBarController 객체
     */
    var navigationController: UINavigationController?
    
    /**
     * @brief loginBaseViewController 객체
     */
    var loginBaseViewController: LoginBaseViewController?
    /**
     * @brief tabBarController 객체
     */
    var tabBarController: UITabBarController?
    
    /**
     * @brief StoryBoardType
     */
    enum StoryBoardType: String {
        case Main = "Main"
        case Login = "Login"
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 네비게이션바의 최초 객체
        let introVC = IntroViewController.init(nibName: "IntroViewController", bundle: nil)
        navigationController = UINavigationController.init(rootViewController: introVC)
        // 네비게이션바 히든
        navigationController?.isNavigationBarHidden = true
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    /**
     * @brief storyBoard를 변경한다.
     * @param enum StoryBoardType
     */
    func changeStoryBoard(type: StoryBoardType) {
        let storyBoard = UIStoryboard(name: type.rawValue, bundle: nil)
        switch type {
        case .Login:
            self.navigationController = nil
            self.tabBarController = nil
            let loginVC = storyBoard.instantiateInitialViewController() as? LoginBaseViewController
            loginBaseViewController = loginVC
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                AppDelegate.applicationDelegate().window?.rootViewController?.view.alpha = 0
            } completion: { [weak self] (finished) in
                guard let strongSelf = self else {
                    return
                }
                DispatchQueue.main.async {
                    strongSelf.window?.rootViewController = loginVC
                    strongSelf.window?.rootViewController?.view.alpha = 0
                    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                        AppDelegate.applicationDelegate().window?.rootViewController?.view.alpha = 1
                    } completion: { (finished) in
                    }
                }
            }
            
            break
        case .Main:
            self.navigationController = nil
            self.tabBarController = nil
            let navigationController: UINavigationController?
            navigationController = storyBoard.instantiateInitialViewController() as? UINavigationController
            if navigationController?.topViewController is UITabBarController {
                tabBarController = navigationController?.topViewController as? UITabBarController
                initTabViewController()
            }
            self.navigationController = navigationController
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                AppDelegate.applicationDelegate().window?.rootViewController?.view.alpha = 0
            } completion: { [weak self] (finished) in
                guard let strongSelf = self else {
                    return
                }
                DispatchQueue.main.async {
                    strongSelf.window?.rootViewController = navigationController
                    strongSelf.window?.rootViewController?.view.alpha = 0
                    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
                        AppDelegate.applicationDelegate().window?.rootViewController?.view.alpha = 1
                    } completion: { (finished) in
                    }
                }
            }
            break
        }
    }
    
    /**
     * @brief TabBarController의 Item 이미지 및 컬러 설정
     */
    func initTabViewController() {
        let MBTIVC = MBTIViewController.init(nibName: "MBTIViewController", bundle: nil)
        let CompatibilityVC = CompatibilityViewController.init(nibName: "CompatibilityViewController", bundle: nil)
        let FeedVC = FeedViewController.init(nibName: "FeedViewController", bundle: nil)
        let TestVC = TestViewController.init(nibName: "TestViewController", bundle: nil)
        
        // init tabbar controller
        let controllers = [MBTIVC, CompatibilityVC, FeedVC, TestVC]
        AppDelegate.applicationDelegate().tabBarController?.viewControllers = controllers
        
        // MBTI
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![0].image = UIImage.init(named: "tab_mbti")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![0].selectedImage = UIImage.init(named: "tab_mbti_sel")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![0].title = "MBTI"
        
        // Compatibility
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![1].image = UIImage.init(named: "tab_compatibility")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![1].selectedImage = UIImage.init(named: "tab_compatibility_sel")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![1].title = "궁합"
        
        // Feed
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![2].image = UIImage.init(named: "tab_feed")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![2].selectedImage = UIImage.init(named: "tab_feed_sel")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![2].title = "피드"
        
        // Test
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![3].image = UIImage.init(named: "tab_test")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![3].selectedImage = UIImage.init(named: "tab_test_sel")?.withRenderingMode(.alwaysOriginal)
        AppDelegate.applicationDelegate().tabBarController?.tabBar.items![3].title = "테스트"
        
        // iOS13 이상에서 탭바의 타이틀 컬러가 적용안되는 이슈 해결
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            
            appearance.backgroundColor = .white
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .white
            
            appearance.stackedLayoutAppearance.normal.iconColor = .black
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1),
                NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 12)!
            ]
            
            appearance.stackedLayoutAppearance.selected.iconColor = .blue
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6784313725, green: 0, blue: 1, alpha: 1),
                NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 12)!
            ]
            
            AppDelegate.applicationDelegate().tabBarController?.tabBar.standardAppearance = appearance
        } else {
            // init tabbar item textColor
            UITabBarItem.appearance().setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1),
                NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 12)!
            ], for: .normal)
            
            UITabBarItem.appearance().setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6784313725, green: 0, blue: 1, alpha: 1),
                NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 12)!
            ], for: .selected)
        }
        
        AppDelegate.applicationDelegate().tabBarController?.delegate = self
    }
    
    /**
     * @brief Appdelegate의 객체를 리턴
     */
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
    
    
    
    
    
    
    
    

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "ForYong")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 0 {
            // do your stuff
        }
        print("tabBarIndex : \(tabBarIndex)")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let currentIndex = tabBarController.selectedIndex
        //
        
        return true
    }
}
