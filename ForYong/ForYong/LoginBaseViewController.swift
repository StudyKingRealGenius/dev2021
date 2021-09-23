//
//  LoginBaseViewController.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/05.
//

import UIKit

class LoginBaseViewController: UIViewController {

    @IBOutlet weak var vContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        
        if let navigation = (storyboard.instantiateViewController(withIdentifier: "navigation") as? UINavigationController) {
            navigation.view.frame = CGRect(x: 0, y: 0, width: self.vContent.bounds.size.width, height: self.vContent.bounds.size.height)
            
            self.vContent.addSubview(navigation.view)
            AppDelegate.applicationDelegate().navigationController = navigation
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
