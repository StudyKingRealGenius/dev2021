//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/11/25.

import UIKit
import MBProgressHUD

struct AlbumToast {
    
    static func show(_ message: String, in view: UIView? = nil, duration: TimeInterval = 1.0) {
        guard let targetView = view ?? UIApplication.shared.keyWindow else {
            return
        }
        let toast = MBProgressHUD.showAdded(to: targetView, animated: true)
        toast.isUserInteractionEnabled = false
        toast.mode = .text
        toast.detailsLabel.text = message
        toast.bezelView.style = .solidColor
        toast.bezelView.color = UIColor.init(RGB: "colorLabelDefault")
        toast.contentColor = .white
        toast.removeFromSuperViewOnHide = true
        toast.margin = 10.0
        toast.show(animated: true)
        toast.hide(animated: true, afterDelay: duration)
    }
}
