//
//  CustomIndicatorView.swift
//  GrammarTest
//
//  Created by Emart-iOS on 2021/06/04.
//

import UIKit
import APNGKit

class CustomIndicatorView: UIView {

    static let sharedIndicator = CustomIndicatorView()
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var baseImageView: UIView!
    
    var timer: Timer?
    var count: Int = 0
    var imageView = APNGImageView.init()
    
    override init(frame: CGRect = AppDelegate.applicationDelegate().window?.frame ?? CGRect(x: 0, y: 0, width: CommonSwift.SCREEN_WIDTH(), height: CommonSwift.SCREEN_HEIGHT())) {
        super.init(frame: frame)
        
        let image = APNGImage.init(named: "renew_indicator")
        imageView = APNGImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 25, height: 31)
        
        Bundle.main.loadNibNamed("CustomIndicatorView", owner: self, options: nil)
        self.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showIndicatorFromParentView(animation: Bool) {
        timer = Timer.init(timeInterval: 15.0, target: self, selector: #selector(removeAllIndicator), userInfo: nil, repeats: false)
        RunLoop.main.add(timer!, forMode: .common)
        
        if count == 0 {
            
            self.layer.removeAllAnimations()
            count += 1
            
            if let rootView = AppDelegate.applicationDelegate().window {
                self.layer.frame = rootView.frame
                containerView.layer.frame = rootView.frame
                rootView.addSubview(self)
            }
            
            DispatchQueue.main.async { [weak self] in
                if let strongSelf = self {
                    strongSelf.baseImageView.addSubview(strongSelf.imageView)
                    strongSelf.imageView.startAnimating()
                }
            }
            
            if animation == true {
                containerView.alpha = 0.0
                UIView.animate(withDuration: 0.5) { [weak self] in
                    if let strongSelf = self {
                        strongSelf.containerView.alpha = 1.0
                    }
                } completion: { (finished) in
                }
            }
        }
    }
    
    @objc func removeAllIndicator() {
        if count == 0 {
            return
        }
        
        count = 0
        containerView.alpha = 1.0
        UIView.animate(withDuration: 0.5) { [ weak self] in
            if let strongSelf = self {
                strongSelf.containerView.alpha = 0.0
            }
        } completion: { [weak self] (finished) in
            if let strongSelf = self {
                strongSelf.removeFromSuperview()
                strongSelf.imageView.stopAnimating()
            }
        }

    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
