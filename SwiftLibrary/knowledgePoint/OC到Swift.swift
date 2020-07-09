//
//  OC到Swift.swift
//  swiftCommandLine
//
//  Created by coder on 2020/1/9.
//  Copyright © 2020 coder. All rights reserved.
//

import Foundation

#if os(macOS)
#elseif swift(<3.0)
#endif

func Log<T>(_ msg:T,file:NSString = #file ,funcName:String = #function,line:Int = #line) {
#if DEBUG
    print(file.lastPathComponent,funcName,line,msg)
#endif
}
//将c语言的test修改为test111111
@_silgen_name("test")
func test111111() {
}

class OCToSwift {
    
    init() {
        test1()
    }
    
    
    func test1() {
        // FIXME: 需要修改的
        Log("hahah")
    }
    // MARK: - 相当于OC#pragma-   这里写框架有用的一些东西
    @available(*,unavailable,renamed: "test4")
    func test2() {
        
    }
    
    func test4(){
        
    }
    @available(iOS,deprecated: 9.0)
    @available(macOS,deprecated: 10.12)
    func test3() {
        // TODO: 需要做的
    }
    
}



