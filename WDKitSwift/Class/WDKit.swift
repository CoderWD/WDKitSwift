//
//  WDKit-Swift.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/28.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation
import UIKit


/// 屏幕宽度
let SCREEN_W:CGFloat = UIScreen.main.bounds.width

/// 屏幕高度
let SCREEN_H:CGFloat = UIScreen.main.bounds.height

/// keywindows
let KEY_WINDOW:UIWindow = UIApplication.shared.keyWindow!

/// document路径
let DOCUMENT_PATH:String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!

