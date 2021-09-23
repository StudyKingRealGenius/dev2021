//
//  CommonUtil.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/12.
//

import Foundation
import UIKit

/**
 * @struct CommonUtil.swift
 *
 * @brief 공통으로 사용하는 Util을 모아놓은 struct
 */
struct CommonUtil{
    
    /**
     * @static
     *
     * @brief Debug 모드 로그와 Release 모드의 로그를 다르게 노출
     */
    static func print(output: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        #if DEBUG
        var filename: NSString = file as NSString
        filename = filename.lastPathComponent as NSString
        Swift.print("\(filename) ----- \(line) Line ----- \(function) \n\(output)")
        #else
        Swift.print("")
        #endif
    }
    
    /**
     * @brief modal을 띄운다
     * @param viewController - 이동하는 viewController를 저장하고 있다가 모달을 닫을 때 사용한다
     * @param animateFlag - animation 여부
     * @param modalStyle - modal 띄우려는 스타일
     * @param completion - 함수 실행 후 처리 할 closure
     */
    static func popUpPresentViewController(viewController: UIViewController, animateFlag: Bool, modalStyle: UIModalTransitionStyle = .coverVertical, completion: (() -> (Void))?) {
        if Datamanager.sharedInstance.modalViewControllerList == nil {
            Datamanager.sharedInstance.modalViewControllerList = NSMutableArray.init()
        }
        
        if var topViewController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController {
            while (topViewController.presentedViewController) != nil {
                topViewController = topViewController.presentedViewController!
            }
            viewController.modalTransitionStyle = modalStyle
            viewController.modalPresentationStyle = .overFullScreen
            DispatchQueue.main.async {
                topViewController.present(viewController, animated: animateFlag) {
                    completion?()
                }
            }
        }
        // modal로 이동한 List는 저장하고 있다가 dismiss 시킬 때 사용한다.
        Datamanager.sharedInstance.modalViewControllerList?.add(viewController)
        
        for vc in Datamanager.sharedInstance.modalViewControllerList! {
            CommonUtil.print(output: "modal List : \(vc.self)")
        }
    }
}
