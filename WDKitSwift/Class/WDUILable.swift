//
//  WDUILable-Extension.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/28.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    var textHeight:CGFloat{
        if self.text != nil && self.text!.count > 0 {
            let attributes = [NSAttributedString.Key.font: self.font]
            let option = NSStringDrawingOptions.usesLineFragmentOrigin
            let size:CGSize = (self.text?.boundingRect(with: CGSize(width: self.width, height: CGFloat.greatestFiniteMagnitude), options: option, attributes: attributes as [NSAttributedString.Key : Any], context: nil).size)!
            return size.height
        }else{
            return 0
        }
    }
    
    var textWidth:CGFloat{
        if self.text != nil && self.text!.count > 0 {
            let attributes = [NSAttributedString.Key.font: self.font]
            let option = NSStringDrawingOptions.usesLineFragmentOrigin
            let size:CGSize = (self.text?.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.height), options: option, attributes: attributes as [NSAttributedString.Key : Any], context: nil).size)!
            return size.width
        }else{
            return 0
        }
    }
}
