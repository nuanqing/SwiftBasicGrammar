//
//  ViewController.swift
//  协议
//
//  Created by webplus on 17/10/12.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//Swift 协议
//协议规定了用来实现某一特定功能所必需的方法和属性。
//任意能够满足协议要求的类型被称为遵循(conform)这个协议。
//类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。
//语法
//protocol SomeProtocol{
    //协议内容
//}


import UIKit

protocol FirstProtocol {
    //对属性的规定
    //协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。
    //协议中的通常用var来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示。
//    var marks:Int { get set }
//    var result:Bool { get }
    func attendance() -> String
}

protocol SecondProtocol {
    //对构造器的规定
    //协议可以要求它的遵循者实现指定的构造器。
    //你可以像书写普通的构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体
//    init(name:String)
    //你可以在遵循该协议的类中实现构造器，并指定其为类的指定构造器或者便利构造器。在这两种情况下，你都必须给构造器实现标上"required"修饰符
//    required init(someParameter: Int) {
     //构造器实现
//    }
}

//扩展协议
protocol ThirdProtocol {
    var age: Int { get }
    func protocolType() -> String
}

//协议的继承
//协议能够继承一个或多个其他协议，可以在继承的协议基础上增加新的内容要求。
//协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：
protocol FourProtocol: ThirdProtocol {
    // 协议定义
}
//继承后的协议FourProtocol
extension UIViewController:FourProtocol{
    internal func protocolType() -> String {
        return "扩展协议"
    }

    internal var age: Int {
        return 24
    }

    
    
}


//类专属协议
//你可以在协议的继承列表中,通过添加class关键字,限制协议只能适配到类（class）类型。
//该class关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。
class ViewController: UIViewController,FirstProtocol,SecondProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(attendance())
        
        var items = [10,20,30].makeIterator()
        while let x = items.next() {
            print(x)
        }
        
        print(self.age)
        print(self.protocolType())
    }
    
    internal func attendance() -> String {
        return "协议方法"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

