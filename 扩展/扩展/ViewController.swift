//
//  ViewController.swift
//  扩展
//
//  Created by webplus on 17/10/12.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//Swift 扩展
//扩展就是向一个已有的类、结构体或枚举类型添加新功能。
//扩展可以对一个类型添加新的功能，但是不能重写已有的功能。
//Swift 中的扩展可以：
//添加计算型属性和计算型静态属性
//定义实例方法和类型方法
//提供新的构造器
//定义下标
//定义和使用新的嵌套类型
//使一个已有类型符合某个协议
//语法

//extension SomeType{
    //加到SomeType的新功能在这里写
//}

//一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议，语法格式如下：
//extension SomeType:SomeProtocol,AnotherProctocol{
    //协议实现写到这里
//}

import UIKit
//扩展可以向已有类型添加计算型实例属性和计算型类型属性。
//对Int类型扩展 add与sub 属性与方法
extension Int{
    var add:Int {return self + 100}
    var sub:Int {return self - 10}
}
//可变实例方法
//通过扩展添加的实例方法也可以修改该实例本身。
//结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样。
//Double是一个结构体
extension Double{
    mutating func square(){
        let pi = 3.1415
        self = pi * self * self
    }
}

//方法扩展
extension UIViewController{
    func sub(a:Int, b:Int) -> Int {
        return a + b
    }
}

//嵌套类型
//扩展可以向已有的类、结构体和枚举添加新的嵌套类型
extension Int {
    enum calc
    {
        case add
        case sub
        case mult
        case div
        case anything
    }
    
    var print: calc {
        switch self
        {
        case 0:
            return .add
        case 1:
            return .sub
        case 2:
            return .mult
        case 3:
            return .div
        default:
            return .anything
        }
    }
}

func result(numb: [Int]) {
    for i in numb {
        switch i.print {
        case .add:
            print(" 10 ")
        case .sub:
            print(" 20 ")
        case .mult:
            print(" 30 ")
        case .div:
            print(" 40 ")
        default:
            print(" 50 ")
            
        }
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let addition = 4.add
        print(addition)
        let subtraction = 12.sub
        print(subtraction)
        
        var Trial1 = 3.3
        Trial1.square()
        print("圆的面积为: \(Trial1)")
        
        print( self.sub(a: 6, b: 7))
       
        result(numb: [0, 1, 2, 3, 4, 7])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

