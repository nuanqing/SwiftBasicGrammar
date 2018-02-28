//
//  ViewController.swift
//  属性
//
//  Created by webplus on 17/9/27.
//  Copyright © 2017年 sanyi. All rights reserved.

//Swift 属性
//Swift 属性将值跟特定的类、结构或枚举关联。
//属性又拥有存储属性与计算属性的特质，与OC相同 ivar + get + set
//存储属性：存储常量或变量作为实例的一部分,适用于类和结构体 ivar
//计算属性：计算一个值,适用于类，结构体和枚举 get set方法
import UIKit

class ViewController: UIViewController {
    //!代表name会有一个值，在读取的时候，这个值必须存在，否则报错,加上！会自动解析，读取的时候直接访问属性不需要加！或者？(加上也不有意义)
    //?代表age是一个可选值，可能为nil或者稍后会赋值,这样读取的时候需要加上？或者！使用操作符！(代表强制解析)去获取值为nil的可选变量会有运行时错误
    var name:String!
    var name1:String?
    var name2:String?
    var name3:String?
    var name4:String = "funnyJoker"
    //延迟存储属性:延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
    //延迟存储属性一般用于：
    //延迟对象的创建。
    //当属性的值依赖于其他未知类
    //必须以初始化的方法创建
    lazy var stuname = String.init()
    
    //属性的计算属性,oc实例变量模拟
    var _age:Int!
    var age:(Int){
        //设置只读属性 let 相当于只有get方法
        get{
            return _age
        }
        set(theAge){
            _age = theAge + 10
        }
    }
    //属性观察器:属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
    //可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
    //不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。
    //可以为属性添加如下的一个或全部观察器：
    //willSet在设置新的值之前调用
    //didSet在新的值被设置之后立即调用
    //willSet和didSet观察器在属性初始化过程中不会被调用
    
    var counter:Int = 0{
        willSet(newToal){
            print("计数器: \(newToal)")
        }
        didSet{
            if counter > oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = "funnyJoker"
        name3 = "funnyJoker"
        //name2 as Any的方法去获取值为nil的可选变量会返回nil
        //name3! 若不赋值，崩溃
        print(name,name1 ?? "funnyJoker",name2 as Any,name3!,name4)
        //调用的时候完成，set，get方法,不赋值直接读取为空
        stuname = "33"
        print(stuname)
        //Swift 中的属性没有对应的实例变量 OC会有对应的实例变量如：name 属性的实例变量_name,跳过内存语义可以直接修改，访问地址的值
        //Swift 一个类型中属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义
        age = 10
        //输出20
        print(age)
        
        self.counter = 100
        self.counter = 800
        
        //全局变量和局部变量
        //局部变量: 在函数、方法或闭包内部定义的变量,用于存储和检索值。	用于存储和检索值。也用于计算属性。
        //全局变量：函数、方法、闭包或任何类型之外定义的变量。用于存储和检索值。存储属性用于获取和设置值。也用于计算属性。
        
        //类型属性：使用关键字 static 来定义值类型的类型属性，关键字 class 来为类定义类型属性。
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

