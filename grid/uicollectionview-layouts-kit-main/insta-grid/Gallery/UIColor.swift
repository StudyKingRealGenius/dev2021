//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/11/29.

import UIKit

public extension UIColor {
    
    convenience init(RGB rgbCode: Int, alpha: Float = 1.0) {
        self.init(red: CGFloat((rgbCode & 0xFF0000) >> 16)/255.0, green: CGFloat((rgbCode & 0xFF00) >> 8)/255.0, blue: CGFloat(rgbCode & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
    
    convenience init(RGB rgbCode: String, alpha: Float = 1.0) {
        var colorString = rgbCode.trimmingCharacters(in: .whitespacesAndNewlines)
        if colorString.hasPrefix("#") {
            colorString = String(colorString.dropFirst())
        }
        if colorString.count == 8 {
            colorString = String(colorString.dropFirst(2))
        }
        
        var rgb: UInt64 = 0
        Scanner(string: colorString).scanHexInt64(&rgb)
        
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16)/255.0, green: CGFloat((rgb & 0xFF00) >> 8)/255.0, blue: CGFloat(rgb & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
}
