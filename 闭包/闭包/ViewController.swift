//
//  ViewController.swift
//  闭包
//
//  Created by webplus on 17/9/25.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

typealias comletionHandle = (_ respons:String) -> Void

class ViewController: UIViewController {
    var completion:comletionHandle?
    
       override func viewDidLoad() {
        super.viewDidLoad()
        //闭包(Closures)是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
        // Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 匿名函数比较相似。
        //全局函数和嵌套函数其实就是特殊的闭包。
        //Swift中的闭包有很多优化的地方:
        //根据上下文推断参数和返回值类型
        //从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
        //可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
        //提供了尾随闭包语法(Trailing closure syntax)
        //语法:
        //   {(parameters) -> returnType in
        //        statements
        //}
        
        let stuName = {print("Swift 闭包实例")}
        stuName()
        //完整写法,没有返回值
        let say:(String) ->Void = {
            (name:String) ->Void in
            print("hello\(name)")
        }
        say("funnyJoker")
        //没有参数
        let say1:() -> Void = {
            print("hello")
        }
        say1()
        showArray(array: [1,2,3])
        
        
        //Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。
        let names = ["A","AE","D","S","BE"]
        let reversed = names.sorted(by:{$0 > $1})
        print(reversed)
        
        let cmp = {
            (a: Int, b:Int) ->Int in
            if a > b{
                return 1
            }else if a < b
            {
                return -1
            }else
            {
                return 0
            }
        }
        var arr:Array<Int> = [23, 34, 56, 15, 8]
        bubbleSort(array: &arr, cmp: cmp)
        doSomeThing {
            print("逃逸闭包")
        }
        
        
       doSomething2(talk: "约吗？？") { (str) in
        print(str)
        }
        doSomething3(talk: "约吗？？") { (handler) in
            print(handler)
        }
        
        doSomething4(talk: "约吗？？") { (handler) in
            print(handler)
        }
        //注意循环引用
        self.completion? = {(str) in
            print(str)
        }
        
        doSomething5(talk: "嘿嘿")
        /*
         自动闭包:
         顾名思义，自动闭包是一种自动创建的闭包，封装一堆表达式在自动闭包中，然后将自动闭包作为参数传给函数。而自动闭包是不接受任何参数的，但可以返回自动闭包中表达式产生的值。
         
         自动闭包让你能够延迟求值，直到调用这个闭包，闭包代码块才会被执行。说白了，就是语法简洁了，有点懒加载的意思。
         */
        
        var array = ["1","100","hi","hello"]
        print(array.count) // 4
        
        let removeBlock = {array.remove(at: 3)}
        print(array.count) // 4
        
        print("执行代码块移除\(removeBlock())")
        print(array.count) // 3
        
        print("__________________________")

        
        let incrementByTen = makeIncrementor(forIncrement: 10)
        print(incrementByTen())
    }
    
    //闭包表达式作为函数
    func showArray(array:[Int]) -> Void {
        for item in array {
            print(item)
        }
    }
    //函数做为参数
    func bubbleSort(array : inout [Int], cmp: (Int, Int) -> Int){
        for _ in 0..<array.count {
            for j in 0..<(array.count - 1) {
                if array[j] > array[j + 1] {
                    let temp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = temp
                }
            }
        }
        
    }
    /*
     逃逸闭包:
     当一个闭包作为参数传到一个函数中，需要这个闭包在函数返回之后才被执行，我们就称该闭包从函数种逃逸。一般如果闭包在函数体内涉及到异步操作，但函数却是很快就会执行完毕并返回的，闭包必须要逃逸掉，以便异步操作的回调。
     
     逃逸闭包一般用于异步函数的回调，比如网络请求成功的回调和失败的回调。语法：在函数的闭包行参前加关键字“@escaping”。
     */

    //逃逸闭包 实例1 相当于回调
    func doSomeThing(some:@escaping() -> Void) -> Void {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { 
            some()
        }
        print("函数体")
    }
    //实例2
    func doSomething2(talk:String, some:(_ response:String) -> Void) -> Void {
        print(talk)
        some("可以啊!")
    }
    func doSomething3(talk:String, handler:comletionHandle) -> Void {
        print(talk)
        handler("可以啊!")
    }
    //这里的逃逸闭包就是引用了self的变量completion,所以必须加@escaping
    func doSomething4(talk:String, handler:@escaping comletionHandle) -> Void {
        print(talk)
        completion = handler
        completion!("可以啊！")
    }
    func doSomething5(talk:String) -> Void {
        print("嘿嘿")
        self.completion!("哈哈")
    }
    //将一个闭包标记为@escaping意味着你必须在闭包中显式的引用self。
    //其实@escaping和self都是在提醒你，这是一个逃逸闭包，
    //别误操作导致了循环引用！而非逃逸包可以隐式引用self。
    
    //例子如下:
    var completionHandlers: [() -> Void] = []
    //逃逸
    func someFuncionWithEscapingClosure(completionHandler: @escaping () -> Void)
    {
        completionHandlers.append(completionHandler)
    }
    //非逃逸
    func someFunctionWithNonescapingCloure(cloure: () -> Void)
    {
        cloure()
    }
    
    
    
    //捕获值
    //闭包可以在其定义的上下文中捕获常量或变量。
    //即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
    //Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
    //嵌套函数      可以捕获其外部函数所有的参数以及定义的常量和变量。
    func makeIncrementor(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

