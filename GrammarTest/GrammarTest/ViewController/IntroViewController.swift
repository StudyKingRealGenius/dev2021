//
//  IntroViewController.swift
//  GrammarTest
//
//  Created by Emart-iOS on 2021/06/02.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goMainViewController()
    }

    func goMainViewController() {
        UIView.animate(withDuration: 0.25, delay: 1.0, options: .curveEaseOut) {
            AppDelegate.applicationDelegate().window?.rootViewController?.view.alpha = 0
        } completion: { [weak self] (finished) in
            guard let strongSelf = self else {
                return
            }
            
            let mainVC = AppDelegate.applicationMainView()
            AppDelegate.applicationDelegate().mainViewController = mainVC
            
            DispatchQueue.main.async {
                strongSelf.navigationController?.setViewControllers([mainVC], animated: true)
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
                    AppDelegate.applicationDelegate().window?.rootViewController?.view.alpha = 1
                } completion: { (finished) in
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
