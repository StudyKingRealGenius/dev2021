//
//  IntroViewController.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/05.
//

import UIKit

class IntroViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 2, delay: 2, options: .curveEaseOut) {
            
        } completion: { [weak self] (finished) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.introSuccess()
        }
    }
    
    /**
     * @brief 모두 완료되었으면 상황에 따라 메인 혹은 로그인 화면으로 이동한다.
     */
    func introSuccess() {
        
        
        let isAutoLogin = Datamanager.sharedInstance.autoLoginYn
        
        if !isAutoLogin {
            
            
            // 자동로그인 아닐 경우 튜토리얼
            self.openTutorial()
        } else {
            
            privacyPolicyReAgreeStateCheck()
        }
    }
    
    /**
     * @brief 개인정보 처리방침 재동의 팝업 노출 여부 체크
     */
    func privacyPolicyReAgreeStateCheck() {
        
        AppDelegate.applicationDelegate().changeStoryBoard(type: .Login)
    }
    
    func openTutorial() {
        
        // 튜토리얼 노출 여부에 따라서 튜토리얼을 띄운다.
        if Datamanager.sharedInstance.tutorialOpenedYn == true {
            // 로그인 화면으로 이동
            AppDelegate.applicationDelegate().changeStoryBoard(type: .Login)
        } else {
            // 튜토리얼 보여주기
            let tutorialVC = TutorialViewController.init(nibName: "TutorialViewController", bundle: nil)
            popUpPresentViewController(viewController: tutorialVC, animateFlag: true, completion: nil)
        }
    }
}
