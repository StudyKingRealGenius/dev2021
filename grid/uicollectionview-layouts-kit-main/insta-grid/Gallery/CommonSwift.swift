//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/11/30.

import UIKit
import Photos

class CommonSwift {
    
    static var APP_MODE: MODE = .RELEASE
    
    enum MODE {
        case DEV
        case STAGING
        case RELEASE
    }
    
    enum EnvironMent: String {
        case Debug = "Debug"
        case Release = "Release"
    }
    
    static var SERVER_DOMAIN: String {
        switch APP_MODE {
        case .DEV: // 개발 Domain
            return "https://g-album-dev.spazon.com"
        case .STAGING:
            return ""
        case .RELEASE: // 운영 Domain
            return "https://g-album.golfzon.com"
        }
    }
    
    static var API_ENDPOINT: String {
        switch APP_MODE {
        case .DEV: // 개발 Domain
            return "https://g-album-service-api-dev.spazon.com"
        case .STAGING:
            return ""
        case .RELEASE: // 운영 Domain
            return "https://g-album-service-api.golfzon.com"
        }
    }
    
    static let APP_ID = "1558044806"
    static let APPSTORE_ADDRESS = "https://itunes.apple.com/app/id1558044806"
    
    static let kSlideAnimationDuration: TimeInterval = 0.3
    
    static let kTimeOutIntervalWebViewLoad: Double = 35 // 웹뷰 로드 타임아웃
    
    static let kToastShowingDuration: TimeInterval = 3.0
    
    /// 버전에 따른 statusBar 높이
    static var kStatusbarHeightiOS: CGFloat {
        if #available(iOS 11.0, *) {
            guard let root = UIApplication.shared.keyWindow?.rootViewController else {
                return 0
            }
            return root.view.safeAreaInsets.top
        } else {
            return UIApplication.shared.windows[0].rootViewController?.topLayoutGuide.length ?? 0
        }
    }
    
    /// screen 전체 사이즈
    static func SCREEN_FULL() -> CGRect {
        return UIScreen.main.bounds
    }
    
    /// screen 너비
    static func SCREEN_WIDTH() -> CGFloat {
        return SCREEN_FULL().size.width
    }
    
    /// screen 높이
    static func SCREEN_HEIGHT() -> CGFloat {
        return SCREEN_FULL().size.height
    }
    
    static func SAFE_AREA_FRAME() -> CGRect {
        var safeAreaFrame = CGRect()
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            return safeAreaFrame
        }
        if #available(iOS 11.0, *) {
            safeAreaFrame = CGRect(x: root.view.safeAreaInsets.left, y: root.view.safeAreaInsets.top, width: root.view.frame.size.width, height: SCREEN_HEIGHT() - root.view.safeAreaInsets.top - root.view.safeAreaInsets.bottom)
            return safeAreaFrame
        } else {
            safeAreaFrame = root.view.frame
        }
        return safeAreaFrame
    }
    
    /// 아랫쪽 SafeArea 인셋 길이
    static func SAFE_AREA_INSETS_BOTTOM() -> CGFloat {
        let safeAreaFrame = CGRect()
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            return safeAreaFrame.maxY
        }
        return root.view.safeAreaInsets.bottom
    }
    
    static func IS_HIGH_RESOLUTION() -> Bool {
        let scale = UIScreen.main.scale
        if scale == 3.0 {
            return true
        } else {
            return false
        }
    }
    
    // Scale Factor
    static func SCALE() -> CGFloat {
        return UIScreen.main.scale
    }
    
    typealias block_completion = () -> (Void)
    typealias block_completion_param = (_ param: Any) -> (Void)
    
    typealias block_completion_thumbnail = (_ thumbnail: UIImage?) -> (Void)
    typealias block_completion_media_url = (_ responseURL : URL?) -> (Void)
    
    typealias block_completion_asset = (_ asset: PHAsset?) -> (Void)
    typealias block_completion_assets = (_ assets: [PHAsset]?) -> (Void)
}
