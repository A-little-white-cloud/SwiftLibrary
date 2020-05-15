#Specs源
source 'https://github.com/CocoaPods/Specs.git'

#适配最低是多少的的iOS系统
platform :ios, '9.0'

#消除警告
inhibit_all_warnings!

#cocoapods使用dynamic frameworks必须要这个
#用use_frameworks! -> dynamic frameworks 方式 -> .framework
#不用use_frameworks! -> static libraries 方式 -> .a
use_frameworks!

#多个target使用的
abstract_target 'CommonPods' do

    target 'SwiftLibrary' do

        #数据库
        pod 'WCDB.swift', '~> 1.0.8.2'
        #响应式
        pod 'RxSwift'
        #像UI控件的一些rx操作都是在这里面进行扩充的
        pod 'RxCocoa'
        #数据解析
        pod 'SwiftyJSON'
        #控件的约束 相当于masory
        pod 'SnapKit'
        #网络请求
        pod 'Alamofire'

    end

end
