//
//  多线程.swift
//  swiftCommandLine
//
//  Created by coder on 2020/1/13.
//  Copyright © 2020 coder. All rights reserved.
//

import Foundation

func testmultithreading() {
    
    DispatchQueue.global().async {
        
    }
    //串行队列
    _ = DispatchQueue(label: "serialqueue")
    ///全局并发队列
    _ = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
    ///主队列
    _ = DispatchQueue.main
    
    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).asyncAfter(deadline: DispatchTime.now() + 2.0) {
        
        print("haha")
    }
    /**
     abel： 队列的标识符，方便调试
     qos：
        User Interactive： 和用户交互相关，比如动画等等优先级最高。比如用户连续拖拽的计算
        User Initiated： 需要立刻的结果，比如push一个ViewController之前的数据计算
        Utility： 可以执行很长时间，再通知用户结果。比如下载一个文件，给用户下载进度。
        Background： 用户不可见，比如在后台存储大量数据
     attributes： 队列的属性。类型是DispatchQueue.Attributes,是一个结构体，遵循了协议OptionSet。意味着你可以这样传入第一个参数[.option1,.option2]。
     默认：队列是串行的。
        .concurrent：队列为并行的。
        .initiallyInactive：则队列任务不会自动执行，需要开发者手动触发。
    autoreleaseFrequency： 顾名思义，自动释放频率。有些队列是会在执行完任务后自动释放的，有些比如Timer等是不会自动释放的，是需要手动释放。
     */
    let label = "com.leo.demoQueue"
    let qos =  DispatchQoS.default
    let attributes = DispatchQueue.Attributes.concurrent
    let autoreleaseFrequency = DispatchQueue.AutoreleaseFrequency.never
    
    let queue = DispatchQueue(label: label, qos: qos, attributes: attributes, autoreleaseFrequency: autoreleaseFrequency, target: nil)
    
    
    //挂起队列
    queue.suspend()
    //继续队列
    queue.resume()

    ///线程组
    let item = DispatchWorkItem {
        print("dispatch__4")
    }
    
    let group = DispatchGroup()
    let asyncQueue1 = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
    asyncQueue1.async(group: group, execute: DispatchWorkItem(block: {
        sleep(5)
        print("dispatch__1")
    }))
    asyncQueue1.async(group: group, execute: DispatchWorkItem(block: {
        sleep(5)
        print("dispatch__2")
    }))
    
    group.notify(queue: asyncQueue1) {
        print("dispatch__3")
    }

    group.notify(queue: asyncQueue1, work: item)
    
}
class multithreading {
    
    init() {
        
    }
}
