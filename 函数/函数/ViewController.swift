//
//  ViewController.swift
//  函数
//
//  Created by webplus on 17/9/27.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//Swift 定义函数使用关键字 func。
//定义函数的时候，可以指定一个或多个输入参数和一个返回值类型。
//每个函数都有一个函数名来描述它的功能。通过函数名以及对应类型的参数值来调用这个函数。函数的参数传递的顺序必须与参数列表相同。
//函数的实参传递的顺序必须与形参列表相同，-> 后定义函数的返回值类型。
import UIKit

class ViewController: UIViewController {
    var name:String? = "funnyJoker"
    var numb1:Int = 0
    var numb2:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //可以加self，也可以不加，但函数都是self的引用
        self.say1()
        say2()
        say3(name: name!)
        say4(name1: name!, name2: "fun")
        print(say5(name: name!))
       let tuple = minMax(array: [1,2,3,4,5,6])
        print(tuple as Any)
        print(tuple?.min as Any,tuple?.max as Any)
        //这里调用的是外部参数
        say6(name1: name!, name2: "fun")
        //可变参数里数据类型必须一样
        stuNums(nums: 3,4,5,6)
        stuNums(nums: "3","4","5","6")
        //传入的参数需加&符号，而且类型值的必须确定不能用？与！符号
        numb1 = 11
        numb2 = 22
        exchangeNum(num1: &numb1, num2: &numb2)
        //变量numb1,numb2值被修改
        print("调用函数后:\(numb1),\(numb2)")
        //使用函数为常量或变量
       let additon:(Int, Int) -> Int = sum
        print(additon(6,6))
        //把sum函数作为anthoer函数的参数，调用函数返回结果
       let anSum = anthoer(additon: sum, a: 6, b: 6)
        print(anSum)
        //函数作为返回值
        let sub = caculate(a: 7, b: 10)
        print(sub())
    }
    //语法
    //func funcname(形参) -> return type {
    //    statement1
    //return parameters
    //}
    //不带返回值与参数
    func say1() -> Void {
        print("i am ok!")
    }
    func say2() {
        print("i am ok!")
    }
    //带参数不带返回值
    func say3(name:String) -> Void {
        print("\(name) is ok!")
    }
    //带多个参数
    func say4(name1:String, name2:String) -> Void {
        print("\(name1)和\(name2) are ok!")
    }
    //带参数有返回值
    func say5(name:String) -> String {
        return ("\(name) is ok")
    }
    //元组作为返回值
    //如果你不确定返回的元组一定不为nil，那么你可以返回一个可选的元组类型。
    //注意:可选元组类型如(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。
    func minMax(array:[Int]) -> (min:Int, max:Int)? {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[0..<array.count] {
            if value < currentMin {
                currentMin = value
            }else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin,currentMax)
    }
    //参数为外部参数
    func say6(name1 a:String, name2 b:String) -> Void {
        print(a,b)
    }
    //可变参数
    //可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的。可变参数通过在变量类型名后面加入（...）的方式来定义。
    func stuNums<T>(nums:T...) -> Void {
        for item in nums {
            print(item)
        }
    }
    //修改参数
    func exchangeNum(num1 a:inout Int, num2 b:inout Int) -> Void {
        let temp = a
        a = b
        b = temp
        print(a,b)
    }
    //使用函数为常量或变量
    func sum(a:Int, b:Int) -> Int {
        return a + b
    }
    //函数做为参数,若函数调用写在最后为尾闭包函数
    //闭包函数只传参数，而函数做为参数需要传函数，调用函数
    func anthoer(additon:(Int, Int) -> Int, a:Int,b:Int) -> Int {
        let anSum = additon(a,b)
        return anSum
    }
    //函数作为返回值
    func caculate(a:Int, b:Int) -> () -> Int {
        //内联
        var c = 0
        func sub() -> Int{
           c = a - b
            return c
        }
        return sub
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

