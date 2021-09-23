//
//  DataManager.swift
//  ForYong
//
//  Created by HaeJin Gwon on 2021/09/12.
//

import Foundation
import UIKit

/**
 * @class DataManager.swift
 *
 * @brief 엡에서 사용하는 Data들을 관리하기 위한 manager
 */
class Datamanager {
    
    /**
     * @static
     *
     * @brief 앱에서 저장될 데이터를 관리하기 위한 싱글톤 객체
     */
    static let sharedInstance = Datamanager()
    
    /**
     * @brief modal로 이동한 ViewController 리스트
     */
    var modalViewControllerList: NSMutableArray?
    
    /**
     * @brief 자동로그인 여부, UserDefault에 저장하고 사용한다.
     */
    var autoLoginYn: Bool {
        get {
            let isAutoLogin = UserDefaults.standard.bool(forKey: Userdefault_Key.AUTO_LOGIN_YN)
            return isAutoLogin
        }
        set (autoLoginYn){
            UserDefaults.standard.setValue(autoLoginYn, forKey: Userdefault_Key.AUTO_LOGIN_YN)
        }
    }
    
    /**
     * @brief 튜토리얼 노출 여부 체크
     */
    var tutorialOpenedYn: Bool {
        get {
            let tutorialOpendYn = UserDefaults.standard.bool(forKey: Userdefault_Key.OPEN_TUTORIAL)
            return tutorialOpendYn
        }
        set (tutorialOpenedYn){
            UserDefaults.standard.setValue(tutorialOpenedYn, forKey: Userdefault_Key.OPEN_TUTORIAL)
        }
    }
}
