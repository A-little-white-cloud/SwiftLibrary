//
//  模式匹配.swift
//  swiftCommandLine
//
//  Created by coder on 2020/1/9.
//  Copyright © 2020 coder. All rights reserved.
//

import Foundation

class student {
    var grade = 0
    static func ~= (caseValue:Int,value:student)->Bool{
        return value.grade == caseValue
    }
    
    static func ~= (caseValue:ClosedRange<Int>,value:student)->Bool{
        return caseValue.contains(value.grade)
    }
}

func test() {
  
    //一.通配符模式
    //1._ 通配符 匹配所有的
    //2._? 匹配非nil值。 zzz?带问号就是代表非nil
    
    
//    二.标识符模式 给对应的变量常量名负值
    let a = 10;
    
//    三.值绑定模式  这里的x，y就是绑定对应的3,2
    let  p1 = (3,2)
    switch p1 {
    case let (x,y):
       print(x,y);
    }
    
//    四，元组模式
    let p2:[(Int,Int)] = [(0,0),(0,1),(0,2)]
    for (x, _) in p2 {
       print(x);
    }
    
//    五，枚举case模式 if case = 只有一个case的switch
    if case 0...9 = age { }
    switch age {
    case 0...9:
        print(age);
    default:
        break;
    }
    
    let age1:[Int?] = [1,2,nil]
    for case nil in age1 {
        print("数组里面有空值")
    }
    let tem:[(Int?,Int)] = [(1,2),(nil,1)]
    for case let (x,0) in tem {
        print("y为0",x!)
    }
    
//    六，可选模式
    
    let age:Int? = 1
    if case let x? = age {
       print(x);
    }

//    七，表达式模式 这里匹配x，y的时候调用～=这个运算符 汇编可以看到，如果你想自定义规则可以重写～= 这个运算符
    switch p1 {
    case (0...9,0...2):
        break
    default:
        break
    }
    ///可以这么写的原因就是重写了～=这个方法
    var stu = student()
    switch stu {
    case 0:
        print("0")
    case 1...100:
        print("0")
    default:
        break
    }
    

}

class modelMatching {

    init() {
       
    }
}
