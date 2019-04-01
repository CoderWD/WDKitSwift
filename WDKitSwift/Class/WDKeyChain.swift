//
//  WDKeyChain.swift
//  WDKit-Swift
//
//  Created by 何伟东 on 2019/3/29.
//  Copyright © 2019 何伟东. All rights reserved.
//

import Foundation

class WDKeyChain {
    
    private func getKeychainQuery(service:String) -> NSMutableDictionary {
        return NSMutableDictionary.dictionaryWithValues(forKeys:
            [kSecClassGenericPassword as String,
             kSecClass as String,
             service,kSecAttrService as String,
             service,kSecAttrAccount as String,
             kSecAttrAccessibleAfterFirstUnlock as String,
             kSecAttrAccessible as String]) as! NSMutableDictionary
    }
    
    
    /// 保存信息到钥匙串
    ///
    /// - Parameters:
    ///   - key: <#key description#>
    ///   - data: <#data description#>
    func saveWithKey(key:String,data:Any) {
        let keychainQuery = self.getKeychainQuery(service: key)
        SecItemDelete(keychainQuery as CFDictionary)
        keychainQuery[kSecValueData] = NSKeyedArchiver.archivedData(withRootObject: data)
        SecItemAdd(keychainQuery, nil)
    }
    
    
    /// 提前钥匙串信息
    ///
    /// - Parameter key: <#key description#>
    /// - Returns: <#return value description#>
    func loadWithKey(key:String) -> Any? {
        let keychainQuery = self.getKeychainQuery(service: key)
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
    func deleteWithKey(key:String) {
        let keychainQuery = self.getKeychainQuery(service: key)
        SecItemDelete(keychainQuery as CFDictionary)
    }

    
}
