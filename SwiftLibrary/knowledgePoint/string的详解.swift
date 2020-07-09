//
//  string的详解.swift
//  swiftCommandLine
//
//  Created by coder on 2020/1/10.
//  Copyright © 2020 coder. All rights reserved.
//

import Foundation

/**
 字符串管理
 */
enum R {
    enum string : String{
        case disconnect = "未连接"
        
    }
    
    ///这个logo的默认值就是logo
    enum image : String {
        case logo
    }
}



func StringTest() {
    
    var str1:String = String()
    str1.append("1")
    var str2 = str1 + "_2"
    var str3 = "\(str2)_3"
    str3.insert(contentsOf: "_4", at: str3.index(str3.startIndex, offsetBy: 5 ))
    str3.removeAll {
        (Character) -> Bool in
        return  Character == "4"
    }
    print(str1,str2,str3)
    //substring和它的base是共享字符串内存的 字符串内存只有一份 可以把这个str4理解成一个指针
    //如果是后面发现要改这个substring 那就会进行一次重新的内存开辟 分配给substring
    let str4 = str3.prefix(3)
    //截取之前的字符串
    print(str4,str4.base)
    
    //substring转String
    let str5 = String(str4)
    print(str5)
    ///多行字符串
    let str6 = """
            1
                2
                    2
        """
    print(str6)
    
    ///String 和NSString是可以互相桥接的 汇编可看
    _ = str5 as NSString
    let str7:NSString = ""
    _ = str7 as String
    
    print(R.image.logo)
    
}




