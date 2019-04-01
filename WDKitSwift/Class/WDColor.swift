//
//  WDColor.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/28.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation
import UIKit

public func HEX_COLOR(hex:NSInteger,alpha:CGFloat) ->UIColor{
    return UIColor(red:(((CGFloat)((hex & 0xFF0000) >> 16))/255.0), green: ((CGFloat)((hex & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(hex & 0xFF))/255.0, alpha: alpha)
}

public func HEX_COLOR(hex:NSInteger) ->UIColor{
    return HEX_COLOR(hex: hex, alpha: 1.0)
}
