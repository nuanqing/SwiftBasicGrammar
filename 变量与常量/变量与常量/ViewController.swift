//
//  ViewController.swift
//  变量与常量
//
//  Created by webplus on 17/9/19.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

//变量是一种使用方便的占位符，用于引用计算机内存地址。
//Swift 每个变量都指定了特定的类型，该类型决定了变量占用内存的大小，不同的数据类型也决定可存储值的范围。

var name = "funnyJoker"
var weight:Int? = 130 //(给一个确定的值,也可以不给)
var Weight:Int?
var WEight:Int!
var myString:String? = nil//(使用操作符！去获取值为nil的可选变量会有运行时错误。你可以用可选链接和可选绑定选择性执行可选表达式上的操作。如果值为nil，任何操作都不会执行，也不会有运行报错。)

//var Weight2:String = nil //错误方法

var weight1:Optional<Int>//(与上面的方法等价,Swift 的可选（Optional）类型，用于处理值缺失的情况。可选表示"那儿有一个值，并且它等于 x "或者"那儿没有值"。Swfit语言定义后缀？)

//Optional 是一个含有两种情况的枚举，None 和 Some(T)，用来表示可能有或可能没有值。任何类型都可以明确声明为（或者隐式转换）可选类型。当声明一个可选类型的时候，要确保用括号给 ? 操作符一个合适的范围。例如，声明可选整数数组，应该写成 (Int[])? 写成 Int[]? 会报错。当你声明一个可选变量或者可选属性的时候没有提供初始值，它的值会默认为 nil。

//可选项遵照 LogicValue 协议，因此可以出现在布尔环境中。在这种情况下，如果可选类型T?包含类型为T的任何值（也就是说它的值是 Optional.Some(T) ），这个可选类型等于 true，反之为 false。

//var weght:String 此方法错误

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(name)
        
        print(weight!)//(如果一个可选类型的实例包含一个值，你可以用后缀操作符 ！来访问这个值)
//        print(Weight!) (会崩溃:fatal error: unexpectedly found nil while unwrapping an Optional value)
        
        var pid:String //(相当于NSString *pid;)
        pid = "7546777"
        print("\(name)的id号码为:\(pid)")
        
        if myString != nil {
            print(myString!)
        }else{
            print("字符串为 nil")
        }
 //       print(myString!)//此方法会出错
        print(myString)//可以这样写
        //强制解析 (对于Optional类型)
        Weight = 300
        print(Weight!)
        //自动解析 (你可以在声明可选变量时使用感叹号（!）替换问号（?）。这样可选变量在使用时就不需要再加一个感叹号（!）来获取值，它会自动解析。)
        WEight = 400
        print(WEight)
        //可选绑定 (使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量。)
        if let someBodyWeight = Weight {
            print("\(name)的体重为:\(someBodyWeight)")
        }else{
            print("\(name)没有设置体重")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

