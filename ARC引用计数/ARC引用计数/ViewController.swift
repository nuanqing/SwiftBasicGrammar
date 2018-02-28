//
//  ViewController.swift
//  ARC引用计数
//
//  Created by webplus on 17/10/11.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//Swift 自动引用计数（ARC）
//Swift 使用自动引用计数（ARC）这一机制来跟踪和管理应用程序的内存
//通常情况下我们不需要去手动释放内存，因为 ARC 会在类的实例不再被使用时，自动释放其占用的内存。
//但在有些时候我们还是需要在代码中实现内存管理。
//ARC 功能
//当每次使用 init() 方法创建一个类的新的实例的时候，ARC 会分配一大块内存用来储存实例的信息。
//内存中会包含实例的类型信息，以及这个实例所有相关属性的值。
//当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。
//为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。
//实例赋值给属性、常量或变量，它们都会创建此实例的强引用，只要强引用还在，实例是不允许被销毁的。


import UIKit

class Person {
    let name:String
    init(name:String) {
        self.name = name
        print("\(name)开始初始化")
    }
    deinit {
        print("\(name)被析构")
    }
}

//两个类之间的强引用（同OC）
//两个类实例互相保持对方的强引用，并让对方不被销毁。这就是所谓的循环强引用
//解决实例之间的循环强引用
//Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：
//弱引用 weak关键字
//无主引用 unowned关键字
//弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。
//对于生命周期中会变为nil的实例使用弱引用。相反的，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。
class Human {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) 被析构") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    var tenant: Human?
    //weak var tenant:Human? (使用weak关键字能够弱化引用)
    deinit { print("Apartment #\(number) 被析构") }
}
//闭包引起的循环强引用
//循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了实例。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod。这两种情况都导致了闭包 "捕获" self，从而产生了循环强引用。
//弱引用和无主引用
//当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。
//相反的，当捕获引用有时可能会是nil时，将闭包内的捕获定义为弱引用。
//如果捕获的引用绝对不会置为nil，应该用无主引用，而不是弱引用。
class Animal {
    var name:String?
    
    lazy var type:() -> String = {
        //self永不为nil使用unowned,可能为nil时使用[weak self] 能够防止self变成野指针后程序崩溃
        [unowned self] in
         return "\(self.name!)的种类为:猫科动物"
    }
    
    init(name:String) {
        self.name = name
    }
    deinit {
        print("\(name!) is being deinitialized")
    }
}

class ViewController: UIViewController {
    var animal:Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //reference1的值会被初始化为nil，此时并不会引用到Person类的实例
        var reference1:Person?
        var reference2:Person?
        var reference3:Person?
        //创建Person类的实例，此时强引用+1
        reference1 = Person.init(name: "funnyJoker")
        //赋值给其他两个变量，该实例会被强引用两次+2
        reference2 = reference1
        reference3 = reference1
        //强引用-1
        reference1 = nil
        //强引用-1
        reference2 = nil
        //强引用-1 此时 = 0，被析构（计数原理同OC）,调用析构函数
        reference3 = nil
        
        
        // 两个变量都被初始化为nil
        var fun: Human?
        var number: Apartment?
        // 赋值
        fun = Human(name: "FunnyJoker")
        number = Apartment(number: 73)
        
        // 循环强引用被创建,两个类的实例相互持有,内存泄漏
        fun!.apartment = number
        number!.tenant = fun
        //并不会调用析构函数，实例相互持有，不能释放
        fun = nil
        number = nil
        
        animal = Animal.init(name: "Tom")
        print(animal!.type())
        animal = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

