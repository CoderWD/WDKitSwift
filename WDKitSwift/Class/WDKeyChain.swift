//
//  WDKeyChain.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/29.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation
import Security


public class WDKeyChain:NSObject {
    private static func getKeychainQuery(service:String) -> NSMutableDictionary{
        let keychainQuery = [
            kSecClass:kSecClassGenericPassword,
            kSecAttrService:service,
            kSecAttrAccount:service,
            kSecAttrAccessible:kSecAttrAccessibleAfterFirstUnlock
            ] as [CFString : Any]
        return keychainQuery as! NSMutableDictionary
    }
    
    
    /// 保存信息到钥匙串
    ///
    /// - Parameters:
    ///   - key: <#key description#>
    ///   - data: <#data description#>
    static public func saveWithKey(key:String,data:Any) {
        let keychainQuery = WDKeyChain.getKeychainQuery(service: key)
        SecItemDelete(keychainQuery as CFDictionary)
        keychainQuery[kSecValueData] = NSKeyedArchiver.archivedData(withRootObject: data)
        SecItemAdd(keychainQuery, nil)
    }
    
    
    /// 提前钥匙串信息
    ///
    /// - Parameter key: <#key description#>
    /// - Returns: <#return value description#>
    static public func loadWithKey(key:String) -> Any? {
        let keychainQuery = WDKeyChain.getKeychainQuery(service: key)
        keychainQuery[kSecReturnData] = kCFBooleanTrue
        keychainQuery[kSecMatchLimit] = kSecMatchLimitOne
        
        var extractedData: AnyObject?
        if SecItemCopyMatching(keychainQuery, &extractedData) == noErr {
            let result = NSKeyedUnarchiver.unarchiveObject(with: extractedData as! Data)
            return result
        }
        return nil
    }
    
    
    /// 删除钥匙串信息
    ///
    /// - Parameter key: <#key description#>
    static public func deleteWithKey(key:String) {
        let keychainQuery = WDKeyChain.getKeychainQuery(service: key)
        SecItemDelete(keychainQuery as CFDictionary)
    }
    
    
}
