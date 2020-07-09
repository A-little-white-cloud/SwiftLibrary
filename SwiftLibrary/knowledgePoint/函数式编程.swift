//
//  函数式编程.swift
//  swiftCommandLine
//
//  Created by coder on 2020/1/14.
//  Copyright © 2020 coder. All rights reserved.
//

import Foundation
/**
 函数式编程
 */
func mode(_ v: Int)->Int{
    
    return v%2
}
typealias funType1 = (Int)->Int
func add(_ v:Int)->funType1{
    
    return mode(_:)
}
func funtionnalProgramming(){
    let a = add(1)(10)
}
