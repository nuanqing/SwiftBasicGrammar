//
//  ViewController.swift
//  构造与析构
//
//  Created by webplus on 17/10/10.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit
//构造过程
//构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。
//Swift 构造函数使用 init() 方法。
//与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
//构造器语法
//init(){
    
//}
struct rectangle1{
    var length:Double
    var breadth:Double
    //不设置默认值,必须有初始化方法
    init() {
        length = 6
        breadth = 12
    }
    
}

struct rectangle2{
    //设置默认值后会提供属性的初始化方法,也可以自定义构造器 init() 时提供构造参数
    var length:Double = 6
    var breadth:Double = 12
    //不提供外部名字(不设置默认值需要提供所有属性的初始化,改写后将只提供此初始化方法)
    init(_ a: Double) {
        length = a
    }
}

struct rectangle3{
    //如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。
    //当存储属性声明为可选时，将自动初始化为空 nil。
    var length:Double?
    var breadth:Double?
    
    init(_ a: Double) {
        length = a
    }
}
//Swift 中的子类不会默认继承父类的构造器。
//父类的构造器仅在确定和安全的情况下被继承。
//当你重写一个父类指定构造器时，你需要写override修饰符。

class SuperClass {
    var corners = 4
    var description: String {
        return "\(corners) 边"
    }
}

class SubClass: SuperClass {
     override init(){
        //父类初始化,得到属性,赋值
        super.init()
        corners = 5
    }
}
//类的可失败构造器
//如果一个类，结构体或枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败构造器。
//变量初始化失败可能的原因有：
//传入无效的参数值。
//缺少某种所需的外部资源。
//没有满足特定条件。
//为了妥善处理这种构造过程中可能会失败的情况。
//你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面加添问号(init?)。
class Person{
    let name:String
    init?(name:String) {
        self.name = name
    }
    
}
//可失败构造器 init!
struct StudRecord {
    let stname: String
    
    init!(stname: String) {
        if stname.isEmpty {return nil }
        self.stname = stname
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let area1 = rectangle1.init()
        print("矩形面积为 \(area1.length*area1.breadth)")
        
        let area2 = rectangle2.init(110)
        print("矩形面积为 \(area2.length*area2.breadth)")
        
        let area3 = rectangle3(110)
        //area3.breadth = nil
        print("矩形面积为 \(area3.breadth)")
        
        let sup = SuperClass.init()
        print(sup.description)
        //覆写父类的初始化方法
        let sub = SubClass.init()
        print(sub.description)
        
        let name1 = String()
        let human1 = Person.init(name: name1)
        print("名字为:\(human1?.name)")
        if let human2 = Person.init(name: ""){
        print("名字为:\(human2.name)")
        }
        
        let blankname = StudRecord(stname: "")
        if blankname == nil {
            print("学生名为空")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    Swift 析构过程
//    在一个类的实例被释放之前，析构函数被立即调用。用关键字deinit来标示析构函数，类似于初始化函数用init来标示。析构函数只适用于类类型。
//    析构过程原理
//    Swift 会自动释放不再需要的实例以释放资源。
//    Swift 通过自动引用计数（ARC）处理实例的内存管理。
//    通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。
//    例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前关闭该文件。
//    语法
//    在类的定义中，每个类最多只能有一个析构函数。析构函数不带任何参数，在写法上不带括号：
//    deinit {
        // 执行析构过程
//    }
    
//    实例
//    var counter = 0;  // 引用计数器
//    class BaseClass {
//        init() {
//            counter += 1;
//        }
//        deinit {
//            counter -= 1;
//        }
//    }
    
//    var show: BaseClass? = BaseClass()
//    print(counter)
//    show = nil
//    print(counter)

}

