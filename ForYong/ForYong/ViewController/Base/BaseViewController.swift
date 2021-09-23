//
//  BaseViewController.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/12.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                if #available(iOS 11.0, *) {
                    self.setNeedsUpdateOfHomeIndicatorAutoHidden()
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }

    /**
     * @brief modal을 띄운다.
     * @param viewcontroller - 이동하는 ViewController를 저장하고 있다가 모달을 닫을 때 사용한다.
     * @param animateFlag - animation 여부
     * @param modalStyle - modal 띄우려는 스타일
     * @param completion - 함수 실행 후 처리할 closure
     */
    func popUpPresentViewController(viewController: UIViewController, animateFlag: Bool, modalStyle: UIModalTransitionStyle = .coverVertical, completion: (() -> (Void))?) {
        
        CommonUtil.popUpPresentViewController(viewController: viewController, animateFlag: animateFlag, modalStyle: modalStyle) {
            completion?()
        }
    }
}
