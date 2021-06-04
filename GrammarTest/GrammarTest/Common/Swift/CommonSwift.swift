//
//  CommonSwift.swift
//  GrammarTest
//
//  Created by Emart-iOS on 2021/06/04.
//

import UIKit

class CommonSwift {
    
    // 전체 넓이
    static func SCREEN_FULL() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // 가로
    static func SCREEN_WIDTH() -> CGFloat {
        return SCREEN_FULL().size.width
    }
    
    // 세로
    static func SCREEN_HEIGHT() -> CGFloat {
        return SCREEN_FULL().size.height
    }
}
