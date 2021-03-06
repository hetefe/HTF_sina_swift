//
//  UserAccount.swift
//  sina_htf
//
//  Created by 赫腾飞 on 15/12/14.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit
//自定义对象的归档操作
//对用户数据的对象保存

class UserAccount: NSObject ,NSCoding{
    
    //MARK: 定义属性
    //用于调用access_token，接口获取授权后的access token。
    var access_token: String?
    //access_token的生命周期，单位是秒数。
    var expires_in: NSTimeInterval = 0{
        
        didSet{
            //当过期时间一旦被设置的时候 就立即设置expires_date
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    
    }
    
    //token 的过期日期
    var expires_date:NSDate?
    
//    var remind_in
    //当前授权用户的UID。
    var uid: String?
    
    
    //友好显示名称
    var name: String?
    //用户头像地址（大图），180×180像素
    var avatar_large: String?
    
    //MARK: 重写description使用kvc给对象设置初始值
    init(dict: [String: AnyObject]) {
        //对象构造的最后一步
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    //MARK: 重写description
    override var description: String{
     
        let keys  = ["access_token","expires_in","uid","name","avatar_large","expires_date"]
        
        return dictionaryWithValuesForKeys(keys).description
    }
    
    //保存自定义对象  解归档之后
    func saveAccount(){
        
        //存储在沙盒中
        //字符串拼接路径的方法 在Xcode中被丢了  需要转换成NSString
        let path = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!  as NSString).stringByAppendingString("/account.plist")
//        print("沙盒保存路径 ： \(path)")
        //保存自定义对象
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
    
    }
    //获取沙盒保存信息
    //Class func 表示类方法
    class func loadAccount() -> UserAccount? {
      
        //从磁盘中解档数据
        let path  = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        
//        NSLog("获取 路径--%@",path);
        if let account =  NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? UserAccount{
        
            //对token的有效期进行判断 过期返回nil
            if account.expires_date?.compare(NSDate()) == NSComparisonResult.OrderedDescending{
            
                return account
            }
        }
        return nil
    }
    
  
    
    //解归档
    required init?(coder aDecoder: NSCoder) {
        //将磁盘中二进制数据转换成自定义对象 类似于反序列化
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        uid = aDecoder.decodeObjectForKey("uid") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
        
    }
    //归档  将自定义对象转换成二进制数据  和序列化类似
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token ,forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(avatar_large ,forKey: "avatar_large")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(expires_date, forKey: "expires_date")
    }
    
    
    
    
}
