//
//  WDArchive.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/28.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation

public class WDArchive:NSObject {
    /// 归档
    ///
    /// - Parameter key: <#key description#>
    /// - Returns: <#return value description#>
    static public func archive(object:Any, key:String)->Bool{
        var path = WDArchive.judgeCreateWDArchiveFolder()!
        if path.count > 0 {
            path = path + key
            return NSKeyedArchiver.archiveRootObject(object, toFile: path)
        }
        return false
    }
    
    /// 解档
    ///
    /// - Parameter key: <#key description#>
    /// - Returns: <#return value description#>
    static  public func unarchive(key:String)->Any?{
        var path = WDArchive.judgeCreateWDArchiveFolder()!
        if path.count > 0 {
            path = path + key
            return NSKeyedUnarchiver.unarchiveObject(withFile: path)
        }
        return nil
    }
    
    static  public func deleteArchive(key:String)->Bool?{
        var path = WDArchive.judgeCreateWDArchiveFolder()!
        path = path + key
        if FileManager.default.fileExists(atPath: path) {
            do{
                try FileManager.default.removeItem(atPath: path)
            }catch{
                  return false
            }
        }
        return true
    }
    
    
    
    /// 判断归档路径不存在创建
    private static func judgeCreateWDArchiveFolder()->String?{
        let path = DOCUMENT_PATH + "/WDArchive/";
        if !FileManager.default.fileExists(atPath: path) {
            do{
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                return path;
            }catch{
                return nil;
            }
        }
        return path;
    }
}

