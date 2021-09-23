//
//  LoginJoinViewController.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/05.
//

import UIKit

class LoginJoinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? LoginViewController {
            viewController.completeHandler = { _ in
                
            }
        }
    }

    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        if let _ = sender.destination as? LoginJoinViewController {
            
        }
    }
    
    @IBAction func withoutLogin(_ sender: UIButton) {
        
        AppDelegate.applicationDelegate().changeStoryBoard(type: .Main)
    }
}
