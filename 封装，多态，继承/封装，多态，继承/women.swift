//
//  women.swift
//  封装，多态，继承
//
//  Created by webplus on 17/9/25.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

class women: Person {
    
    override init(name:String, age:Int, score:Int) {
        //需要父类初始化
        super.init(name: name, age: age, score: score)
        self.name = name
        self.age = age
        self.socre = score
    }
    
    override func say(name: String) {
        print(self.name)
    }
}
