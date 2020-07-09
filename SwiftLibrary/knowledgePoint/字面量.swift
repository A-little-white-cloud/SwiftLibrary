//
//  字面量.swift
//  swiftCommandLine
//
//  Created by coder on 2019/11/18.
//  Copyright © 2019 coder. All rights reserved.
//

import Foundation

/**
 系统的字面量就是这么实现的
 可以通过这个修改字面量的类型
 
 swift 自带的绝大部分类型 都可以通过字面量直接进行初始化
 Dictionary，Array，Set，String，Int，Bool，Double，optional等。这些类型能通过字面量创建 是遵守了对应的协议
 */

///FloatLitralType 相当于10 定义为Int
//public typealias IntegerLitralType = Int
///FloatLitralType 相当于1.0 定义为float
//public typealias FloatLitralType = Int
///FloatLitralType 相当于true false 定义为Bool
//public typealias BooleanLitralType = Int
///FloatLitralType 相当于“ ” 定义为String
//public typealias StringLitralType = Int

/**
 用字面量初始化  Literal字面量的意思
 */
extension Int : ExpressibleByBooleanLiteral{
    
    public init(booleanLiteral value: Bool) {
        self = value ? 1 : 0
    }
}
struct person{
    
    var age = 10
}
extension person : ExpressibleByIntegerLiteral{
    
    init(integerLiteral value: Int) {
        self.age = value;
    }
}
struct point {
    var x = 0
    var y = 0
}
extension point : ExpressibleByArrayLiteral,CustomDebugStringConvertible{
    
    init(arrayLiteral elements: Int...){
        if elements.count != 2 {return;}
        self.x = elements[0]
        self.y = elements[1]
    }
    var debugDescription: String {
        get{
            
         return "point: x = \(x) y = \(y)"
        }
    }
}



func HJ_literalTest(){
    
    let a:Int = true
    let per:person = 10
    let p:point = [1,2]
    print(a,per.age,p);
    
}




class HJ_literal{
    init() {
        print("/*****************************************HJ_literal*****************************************/")
        HJ_literalTest()
    }
}
