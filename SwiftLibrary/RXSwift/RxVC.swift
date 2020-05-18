//
//  RxVC.swift
//  SwiftLibrary
//
//  Created by coder on 2020/5/17.
//  Copyright © 2020 xihang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
/**
 question:
 1.Error这种i协议的如何j创建对象，也就是主动发送error方法
 
 
 */

class RxVC: UIViewController {
    var textField:UITextField!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        observer()
        rxSingle()
        rxCompletable()
        rxMaybe()
    }
    
    
    func observer() {
        ///创建序列最直接的方法就是调用 Observable.create，然后在构建函数里面描述元素的产生过程。 observer.onNext(0) 就代表产生了一个元素，他的值是 0。后面又产生了 9 个元素分别是 1, 2, ... 8, 9 。最后，用 observer.onCompleted() 表示元素已经全部产生，没有更多元素了。
        let observer = Observable<Int>.create { (obs) -> Disposable in
            
            obs.onNext(1)
            obs.onNext(2)
            obs.onNext(3)
            obs.onNext(4)
            obs.onNext(5)
            obs.onCompleted()
            
            return Disposables.create()
        }
        ///subscrible的时候会触发create传进去的闭包
        observer.subscribe(onNext: { (value) in
            print(value)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("完成")
        }).disposed(by: bag)
    }
    
    ///Single 是 Observable 的另外一个版本。不像 Observable 可以发出多个元素，它要么只能发出一个元素，要么产生一个 error 事件。
    func rxSingle() {
        
        let singleObsever = Single<[String:Any]>.create {
            (single: @escaping (SingleEvent<[String : Any]>) -> Void) -> Disposable in
            
            single(.success(["fdsfa":"sfdsf"]))
            return Disposables.create()
        }
        singleObsever.subscribe(onSuccess: { (value) in
            print(value)
        }) { (error) in
            print(error)
        }.disposed(by: bag)
    }
    ///不像 Observable 可以发出多个元素，它要么只能产生一个 completed 事件，要么产生一个 error 事件。
    func rxCompletable() {
        
        let rxcompletable = Completable.create { (complete:@escaping (CompletableEvent) -> Void) -> Disposable in
            complete(.completed)
            return Disposables.create()
        }
        rxcompletable.subscribe(onCompleted: {
            print("成功了")
        }) { (error) in
//            print(error)
        }.disposed(by: bag)
    }
    
    ///它要么只能发出一个元素，要么产生一个 completed 事件，要么产生一个 error 事件。
    func rxMaybe() {
        Maybe<String>.create { (block:@escaping (MaybeEvent<String>) -> Void) -> Disposable in
            
            block(.success("rxMaybe成功了"))
            block(.completed)
            return Disposables.create()
        }.subscribe(onSuccess: { (success) in
            print(#function,success)
        }, onError: { (error) in
            print(#function,"rxMaybe",error)
        }) {
            print(#function,"完成了")
        }.disposed(by: bag)
    }

}

///Observable 可观察的对象
extension RxVC {
     /*
         ControlProperty 专门用于描述 UI 控件属性的，它具有以下特征：
         1.一定在 MainScheduler 订阅（主线程订阅）
         2.一定在 MainScheduler 监听（主线程监听）
         3.不会产生 error 事件
         **/
        /*
         Driver(可以将普通序列转换为 Driver)
         1.不会产生 error 事件
         2.一定在 MainScheduler 监听（主线程监听）
         3.throttle(time,scheduler) 2秒内只去第一次和最后一次的结果
         **/
        func rxDriver(){
          
    //        query.rx.text.throttle(.seconds(2), scheduler: MainScheduler.instance).flatMapLatest { (str) -> ObservableConvertibleType in
    //            return str
    //        }
            
        }
        /**
         Signal 和 Driver 相似，唯一的区别是，Driver 会对新观察者回放（重新发送）上一个元素，而 Signal 不会对新观察者回放上一个元素。
         
         */
        func rxSignal()  {
        
        }
        
        func rxContolEvent() {
            
        }
    
}

///Observer  观察者
extension RxVC {
    
    ///AnyObserver 可以用来描叙任意一种观察者。
    func rxAnyObserver() {
        
        
        let obsservable = Observable<String>.create { (str) -> Disposable in
            
            return Disposables.create()
        }
        obsservable.subscribe(onNext: { (str) in
            
        }).disposed(by: bag)
        
        ///上面的额相当于下面的subscribe相当于
        ///其实这个闭包穿进去也是封装成一个 AnyObserver对象
        let Observer : AnyObserver<String> = AnyObserver{ (event) in
            switch event{
                
            case .next(_):
                print("next")
            case .error(_):
                print("error")
            case .completed:
                print("completed")
            }
            
        }
        obsservable.subscribe(Observer).disposed(by: bag)
    }
    
    /**
     1.不会处理错误事件
     2.确保绑定都是在给定 Scheduler 上执行（默认 MainScheduler）
     */
    func rxBinder() {
        
        let obsservable = Observable<Bool>.create { (str) -> Disposable in
            
            return Disposables.create()
        }
        obsservable.subscribe(onNext: { (str) in
            
        }).disposed(by: bag)
        
        ///上面的额相当于下面的subscribe相当于
        ///其实这个闭包穿进去也是封装成一个 AnyObserver对象
        let binder = Binder<Bool>(self.textField) { (target, isHidden) in
            target.isHidden = isHidden
        }
        obsservable.bind(to: binder).disposed(by: bag)
    }
    
    /**
     Observable & Observer 既是可监听序列也是观察者
     */
    func ObservableAndObserver() {
        ///作为可被观察的对象
        let observable = self.textField.rx.text
        observable.subscribe(onNext: { (text) in
            
        }).disposed(by: bag)
        
        ///作为观察者
        let observer = self.textField.rx.text
        let ob = Observable<String>.create { (observer) -> Disposable in
            return Disposables.create()
        }
        ob.bind(to: observer).disposed(by: bag)
        
    }
    
}
