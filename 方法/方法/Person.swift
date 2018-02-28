//
//  Person.swift
//  方法
//
//  Created by webplus on 17/10/10.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

//实例方法是被类型的某个实例调用的方法，你也可以定义类型本身调用的方法，这种方法就叫做类型方法。
//声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的实现方法。
class Person: NSObject {
    
    class func sum3(num1:Int, num2:Int){
        let num3 = num1 + num2
        print("Person类的两数之和为:\(num3)")
    }
    
}
