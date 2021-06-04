//
//  MainViewController.swift
//  GrammarTest
//
//  Created by Emart-iOS on 2021/06/04.
//

import UIKit

class MainViewController: UIViewController {

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
    @IBAction func btnShowIndicatorTouched(_ sender: Any) {
        CustomIndicatorView.sharedIndicator.showIndicatorFromParentView(animation: true)
    }
    
}
