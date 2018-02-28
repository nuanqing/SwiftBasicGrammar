//
//  ViewController.swift
//  方法
//
//  Created by webplus on 17/10/10.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活的在你创建的类型（类/结构体/枚举）上定义方法。
//在 Swift 语言中，实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
//实例方法提供以下方法：
//可以访问和修改实例属性
//提供与实例目的相关的功能
//实例方法要写在它所属的类型的前后大括号({})之间。
//实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
//实例方法只能被它所属的类的某个特定实例调用。
//实例方法不能脱离于现存的实例而被调用。
import UIKit

struct area {
    var length:Int = 1
    var breadth:Int = 1
    
    func area() -> Int {
        return length + breadth
    }
    //Swift 语言中结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
    //但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。
    mutating func scaleBy(res:Int){
        length += res
        breadth += res
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //语法
//        func funcname(parameters) -> returntype{
//            Statement1
//            Statement2
//            return parameters
//        }
        //内部参数与外部相同
        sum1(num1: 1, num2: 2)
        //调用时为外部参数，可将firstNum替换为_ 代表外部参数省略
        //self 属性
        //类型的每一个实例都有一个隐含属性叫做self，self 完全等同于该实例本身。
        //你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例
        self.sum2(firstNum: 1, secondNum: 2)
        
       //结构体中的变异方法，可以修改属性值
        var S = area.init(length: 3, breadth: 3)
        print(S.area())
        S.scaleBy(res: 3)
        print(S.length)
        print(S.breadth)
        //调用类方法
        Person.sum3(num1: 1, num2: 2)
    }
//Swift 函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称(调用函数时使用)OC的局部名称与外部名称相同
    func sum1(num1:Int, num2:Int) -> Void {
        let num3 = num1 + num2
        print("两数之和为:\(num3)")
    }
    func sum2(firstNum a:Int, secondNum b:Int) -> Void {
        print("两数之和为:\(a + b)")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

