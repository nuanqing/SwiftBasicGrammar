//
//  ViewController.swift
//  泛型
//
//  Created by webplus on 17/10/12.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//Swift 泛型
//Swift 提供了泛型让你写出灵活且可重用的函数和类型。
//Swift 标准库是通过泛型代码构建出来的。
//Swift 的数组和字典类型都是泛型集。
//你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。


//类型约束
//类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
//}
//上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束。

//泛型协议
//这样协议不用指明方法参数类型,等到调用的时候设定参数需要的类型，提供更好的封装性,同时Element约束了两个方法的参数必须是相同的类型
protocol SomeProtocol {
    associatedtype Element
    func Method1(element: Element)
    func Method2(element: Element)
}

struct TestStruct:SomeProtocol {
    func Method1(element: String) {
        print("Method1: \(element)")
    }
    func Method2(element: String) {
        print("Method2: \(element)")
    }
}

//Where 语句
//类型约束能够确保类型符合泛型函数或类的定义约束。
//你可以在参数列表中通过where语句定义参数的约束。
//你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。

//简化程序方便运算
//func anyCommonElements<T : SquenceType, U : SequenceType>(lhs : T, _ rhs : U) -> Bool where
//    T.Generator.Element: Equatable,
//    T.Generator.Element == U.Generator.Element{
//        return false
//}


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Int类型
        var num1 = 100
        var num2 = 200
        //调用函数时，两个参数类型必须相同
        swapTwoValues(&num1, &num2)
        print(num1,num2)
        //String类型
        var str1 = "100"
        var str2 = "200"
        swapTwoValues(&str1, &str2)
        print(str1,str2)
        
        let ts = TestStruct.init()
        ts.Method1(element: "fun")
        ts.Method2(element: "joker")
        
        
    }
    //功能相同的代码，只是类型上不一样，这时我们可以使用泛型，从而避免重复编写代码
    func swapTwoValues<T>(_ a:inout T, _ b:inout T) -> Void {
        let temp = a
        a = b
        b = temp
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

