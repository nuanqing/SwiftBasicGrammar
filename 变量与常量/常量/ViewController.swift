//
//  ViewController.swift
//  常量
//
//  Created by webplus on 17/9/19.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit
//常量一旦设定，在程序运行时就无法改变其值。常量可以是任何的数据类型如：整型常量，浮点型常量，字符常量或字符串常量。同样也有枚举类型的常量：常量类似于变量，区别在于常量的值一旦设定就不能改变，而变量的值可以随意更改。
let name = "funnyJoker"
let weight:Int? = 130 //(给一个确定的值,也可以不给)
//let Weight:Int?//(let 为常量,初始化必须给定值)
//let WEight:Int!
let myString:String? = nil
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(name)
        
        let pid:String = "7548777"
        // let pid = "7548777" //(类型安全Swift 是一个类型安全（type safe）的语言。由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查（type checks），并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。)
        print("\(name)的id号码为:\(pid)")
        
        print(myString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

