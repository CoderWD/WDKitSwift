//
//  WDUIView-Extension.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/28.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation
import UIKit

public extension UIView{
    var height:CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: self.frame.size.width, height: newValue))
        }
    }
    
    var width:CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: newValue, height: self.frame.size.height))
        }
    }
    
    var x:CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            self.frame = CGRect(origin: CGPoint(x: newValue, y: self.frame.origin.y), size: self.frame.size)
        }
    }
    
    var y:CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            self.frame = CGRect(origin: CGPoint(x: self.frame.origin.x, y: newValue), size: self.frame.size)
        }
    }
    
    var centerX:CGFloat {
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY:CGFloat {
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    
    /// 获取当前viewController
    var  viewController:UIViewController? {
        var next = self.next
        while next != nil {
            if next is UIViewController {
                return next as? UIViewController
            }
            next = next?.next
        }
        return nil
    }
    
    
    /// 设置圆角
    ///
    /// - Parameter cornerRedius: <#cornerRedius description#>
    func setCornerRadius(cornerRedius:CGFloat){
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.cornerRadius = cornerRedius
        self.layer.masksToBounds = true
    }
    
    
    /// 设置边框大小和边框y颜色
    ///
    /// - Parameters:
    ///   - width: <#width description#>
    ///   - color: <#color description#>
    func setBorder(width:CGFloat,color:UIColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    
    /// view截图
    ///
    /// - Returns: <#return value description#>
    func hotScreen() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.width, height: self.height), false,UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image;
    }
    
}
