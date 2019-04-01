//
//  WDUIImage-Extension.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/28.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage{
    
    /// 根据颜色获取一个像素的图片
    ///
    /// - Parameter color: <#color description#>
    /// - Returns: <#return value description#>
    func imageWithColor(color:UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()!
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 1, height: 1)
        layer.backgroundColor = color.cgColor
        layer.render(in: ctx)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 按图片的宽度压缩图片
    ///
    /// - Parameters:
    ///   - img: <#img description#>
    ///   - targetWidth: <#targetWidth description#>
    /// - Returns: <#return value description#>
    func compressImage(img:UIImage,targetWidth:CGFloat) -> UIImage? {
        let size = img.size
        let width = size.width
        let height = size.height
        let targetHeight = (targetWidth/width)*height
        UIGraphicsBeginImageContext(CGSize(width: targetWidth, height: targetHeight));
        img.draw(in: CGRect(x: 0, y: 0, width: targetWidth, height: targetHeight))
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImg
    }
}

