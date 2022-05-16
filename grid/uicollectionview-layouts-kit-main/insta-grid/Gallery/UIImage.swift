//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/12/08.

import UIKit
import AlamofireImage

public extension UIImage {
    
    static let imageCache = AutoPurgingImageCache()
    
    /// - Parameters:
    ///   - color: Color
    ///   - size: Size
    /// - Returns: image
    class func imageWithUIColor(_ color: UIColor, size: CGSize) -> Self {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(rect.size)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        func typeHelper<T>(_ image: UIImage) -> T {
            return image as! T
        }
        return typeHelper(image)
    }
    
    class func imageWithUIColor(_ color: UIColor) -> Self {
        return imageWithUIColor(color, size: CGSize(width: 1, height: 1))
    }
    
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image {
            context in self.draw(in: CGRect(origin: .zero, size: size))
        }
//        AlbumUtil.print(output: "origin: \(self), resize: \(renderImage)")
        
        return renderImage
    }
}
