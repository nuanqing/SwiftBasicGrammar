//
//  ViewController.swift
//  类
//
//  Created by webplus on 17/9/26.
//  Copyright © 2017年 sanyi. All rights reserved.

//Swift 类是构建代码所用的一种通用且灵活的构造体。
//我们可以为类定义属性（常量、变量）和方法。
//与其他编程语言所不同的是，Swift 并不要求你为自定义类去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类，系统会自动生成面向其它代码的外部接口。
//类和结构体对比
//Swift 中类和结构体有很多共同点。共同处在于：
//定义属性用于存储值
//定义方法用于提供功能
//定义附属脚本用于访问值
//定义构造器用于生成初始化值
//通过扩展以增加默认实现的功能
//符合协议以对某类提供标准功能
//与结构体相比，类还有如下的附加功能：
//继承允许一个类继承另一个类的特征
//类型转换允许在运行时检查和解释一个类实例的类型
//解构器允许一个类实例释放任何其所被分配的资源
//引用计数允许对一个类的多次引用
import UIKit

class student:NSObject {
    var studname:String = "funnyJoker"
    var mark1:Int = 88
    var mark2:Int = 77
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //语法
//        class className{
//            Definition 1
//            Definition 2
//            Definition 3
//        }
        //let只读
        let studrecord1 = student()
        print(studrecord1.mark1)
        let studrecord2 = student()
        //如果两个常量或者变量引用同一个类实例则返回 true
        if studrecord1 === studrecord2 {
            print("引用相同的类的实例\(studrecord1)\(studrecord2)")
        }else{
            print("引用不同的类的实例\(studrecord1)\(studrecord2)")
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



