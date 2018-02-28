//
//  Person.swift
//  封装，多态，继承
//
//  Created by webplus on 17/9/25.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

/*
 * 封装: 通常把隐藏属性,方法和方法实现细节的过程称为封装
 
 1.隐藏属性和方法
 使访问控制修饰符将类和其他属性方法封装起来, 常用的有: public, internal, private
 
 public:   从外部模块和本模块都能访问;
 internal: 只有本模块能访问;
 private:  只有本文件可以访问, 本模块的其他文件不能访问;
 */



class Person: NSObject {
    
   public var name:String
   internal var age:Int
   internal var socre:Int
   private var weight:Int?
    
    
    init(name:String, age:Int, score:Int) {
        self.name = name
        self.age = age
        self.socre = score
    }
    
    public func say(name:String){
        
        print("\(name)的年龄:\(self.age)分数:\(self.socre)")
    }
    //默认为private
    func getScore(score:Int) -> Void {
        print(score)
    }
    
    
    
    
}
