//
//  WDString.swift
//  WDKitSwift
//
//  Created by 何伟东 on 2019/4/2.
//  Copyright © 2019 CoderHe. All rights reserved.
//

import Foundation
import CommonCrypto



// 直接给String扩展方法
public extension String {
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    // base64编码
    func base64Encode()->String?{
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    // base64解码
    func base64Decode() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    //哈希值
    func sha1() -> String {
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true)!
        let uint8Ptr = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
        //uint8Ptr.initialize(from: data) //<-copying the data
        let rawPtr = UnsafeRawPointer(uint8Ptr)
        var digest = [UInt8](repeating:0,count:Int(CC_SHA1_DIGEST_LENGTH))
        
        CC_SHA1(rawPtr, CC_LONG(data.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest{
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
    
}
