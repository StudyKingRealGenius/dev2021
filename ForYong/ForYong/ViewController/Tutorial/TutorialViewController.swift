//
//  TutorialViewController.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/12.
//

import UIKit

class TutorialViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonTouched(_ sender: UIButton) {
        Datamanager.sharedInstance.tutorialOpenedYn = true
        AppDelegate.applicationDelegate().changeStoryBoard(type: .Login)
    }
    
}
