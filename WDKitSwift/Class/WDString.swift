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
}
