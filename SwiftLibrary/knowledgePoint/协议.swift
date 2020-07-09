//
//  协议.swift
//  swiftCommandLine
//
//  Created by coder on 2019/9/27.
//  Copyright © 2019 coder. All rights reserved.
//

import Foundation
import CoreGraphics
/*
 协议贯穿了整个swift
 比oc的swift强大太多 比如可以直接给协议扩张实现 这就弥补了不能多继承的不足了
 协议的底层其实也是一个类型 就是协议名称.Type
 AnyObject
 class
 @objec
 这三个都代表只能被类去遵守
 */
/*@objc**/ protocol goodPerson_protocol : AnyObject {
    
}
///@objc optional也就是相当于OC中的optionals
public struct EdgeSpace {
    
    public var vertical: CGFloat
    
    public var horizontal: CGFloat
    
    public init(vertical: CGFloat, horizontal: CGFloat){
        
        self.horizontal = horizontal
        
        self.vertical = vertical
        
    }
    
}

//@objc protocol WaterFallFlowLayoutDatasource{

//optional func waterFallFlowLayout(insetForSectionOfIndex section:Int)->EdgeSpace
//
//}
//
//}

protocol WaterFallFlowLayoutDatasource{

//这里是必须实现的方法

//func waterFallFlowLayout(viewAtIndexPath indexPath:NSIndexPath)->UIView

//    这里是可选方法

func waterFallFlowLayout(insetForSectionOfIndex section:Int)->EdgeSpace

}

//在这里实现一下可选方法的默认值

extension WaterFallFlowLayoutDatasource{

func waterFallFlowLayout(insetForSectionOfIndex section:Int)->EdgeSpace{return EdgeSpace(vertical: 5, horizontal: 5)}

}

@objc protocol Person_Protocol {
    
    //调用这个方法 走的就是objc_msgsend 
    dynamic func run()
    
    @objc optional func run1()
    static func sleep()
    /*
     {}里面代表的权限 可读可写
     这里并不是代表它是计算属性
     */
    var age:Int { set get }
    //只读
    var name:String{ get }
    subscript(index:Int)->Int{set get}
    
    init()
}
///这样就不是必须实现的Person_Protocol的run了
extension Person_Protocol{
    
    func run()  {
        

    }
}

fileprivate class Student : Person_Protocol ,goodPerson_protocol,CustomStringConvertible,CustomDebugStringConvertible{
    
    var description: String {
        get
        {
            return "自定义打印: age = \(age) name = \(name)"
        }
    }
    //release模式下还是会打  llvm po 优先调用的是debugDescription
    var debugDescription: String{
        
        return "debug自定义打印: age = \(age) name = \(name)"
    }
    
    static func sleep() {
        print("sleep")
    }
    
    func run() {
        print("run")
    }
    
    var age: Int = 10
    
    var name: String = "fadsf"
    
    subscript(index: Int) -> Int {
        get {
            print("subscript get")
            return 20
        }
        set {
            print("subscript set")
        }
    }
    
    required init() {
        
    }
}
//必须遵守两个协议和一个类型。 这是协议组合（多个协议和一个class类型【结构体不行】） 也可以取个别名
fileprivate typealias goodManType = goodPerson_protocol & Person_Protocol & Student

fileprivate func goodMan(obj:goodPerson_protocol & Person_Protocol & Student) {
    print("GoodMand")
}

/**
 1.协议里面和其他的一样都是真申明不实现  {}就是用来做权限限制的  和oc一样可以遵循多个协议
 2.枚举结构体类都是可以遵守协议的
 3.协议默认是必须全部实现的（只实现部分的方法？）
 4.实现协议的权限不能小于协议的权限的
 5.协议中定义类型方法必须用static 不能用class  因为不止是类可以遵  【可以在实现的时候将static改成class calss修饰的类方法是为了可以让子类重写】
 6.mutating（允许值类型对象在方法内修改存储属性的值）  类在实现的时候去掉mutating 如果不写就默认没有mutating 你在实现的时候加会报错的
 7.协议中定义初始化器 非final的类在实现的时候初始化器都必须+required 【required 修饰的指定初始化器 表明子类都必须实现该初始化器（继承 重写）】
 8.Any：代表任意类型   AnyObject：代表任意类类型
 */
func testProtocol(){
    
    let par = Student()
    goodMan(obj: par)
    
    print(par)
    debugPrint(par)
    
}







enum Season_1 : Int,CaseIterable{
    
    case spring ,summer,autumn,winter
}
/*
 1.枚举中默认实现了CaseIterable协议
 2.就可以实现便利枚举值
 */
func testCaseIterable() {
    
    _ = Season_1.spring
    let all = Season_1.allCases //[Season_1]数组
    for sea in all {
        
        print("测试CaseIterable协议\(sea)")
    }
    
}

class HJprotocol {

    init() {
        print("**************HJprotocol********************")
        testProtocol()
        testCaseIterable()
    }
}


