//
//  WDJson.swift
//  ManholeCover
//
//  Created by 何伟东 on 2019/4/2.
//  Copyright © 2019 河北旭日正鸿网络科技有限公司. All rights reserved.
//

import Foundation

private class WDJson:NSObject{
    static func toJSONString(_ obj:Any) -> String? {
        if (JSONSerialization.isValidJSONObject(obj)) {
            let data : NSData! = try? JSONSerialization.data(withJSONObject: obj, options: []) as NSData?
            let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
            return JSONString! as String
        }
        return nil
    }
}

public extension NSDictionary{
    func wd_toJSONString() ->String?{
        let json = WDJson.toJSONString(self)
        return json
    }
}


public extension Dictionary{
    func wd_toJSONString() ->String?{
        let json = WDJson.toJSONString(self)
        return json
    }
}


public extension Array{
    func wd_toJSONString() ->String?{
        let json = WDJson.toJSONString(self)
        return json
    }
}

public extension NSArray{
    func wd_toJSONString() ->String?{
        let json = WDJson.toJSONString(self)
        return json
    }
}

// MARK: - 字符串转json对象
public extension String{
    func wd_JSONObject() -> Any?{
        let jsonData:Data = self.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        return dict
    }
}

