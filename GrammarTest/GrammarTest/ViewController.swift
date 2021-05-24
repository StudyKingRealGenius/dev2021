//
//  ViewController.swift
//  GrammarTest
//
//  Created by 권해진 on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {
    
    var myArray: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 0...10 {
            myArray.append(number)
        }
        print(myArray)
    }
}





