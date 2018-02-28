//
//  ViewController.swift
//  封装，多态，继承
//
//  Created by webplus on 17/9/25.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    public var name:String!
    internal var age:Int!
    private var score:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name = "funnyJoker"
        self.age = 12
        self.score = 98
        say(name: self.name, age: self.age, score: self.score)
        
       let p = Person.init(name: self.name, age: self.age, score: self.score)
        p.say(name: p.name)
        //多态 指允许使用一个父类类型的变量或者常量来引用一个子类类型的对象. 根据被引用子类对象特征的不同, 得到不同的运行结果, 即使用父类的类型来调用子类的方式;
        let w:Person = women.init(name: "韩梅梅", age: 24, score: 99)
        
        
        w.say(name: w.name)
        
    }
    
    public func say(name:String, age:Int, score:Int){
        print("\(name)的年龄：\(age)分数：\(score)")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

