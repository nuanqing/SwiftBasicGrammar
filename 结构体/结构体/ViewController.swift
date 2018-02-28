//
//  ViewController.swift
//  结构体
//
//  Created by webplus on 17/9/26.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

//结构体
//在你的代码中，你可以使用结构体来定义你的自定义数据类型。
//结构体实例总是通过值传递来定义你的自定义数据类型。
//按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
//结构体的主要目的是用来封装少量相关简单数据值。
//有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
//任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
//结构体不需要去继承另一个已存在类型的属性或者行为。
struct MarkStudent {
    var mark1:Int
    var mark2:Int
    var mark3:Int
    init(mark1:Int, mark2:Int, mark3:Int) {
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}

struct WeightStudent {
    var weight1 = 11
    var weight2 = 22
    var weight3 = 33
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let markA = MarkStudent.init(mark1: 66, mark2: 77, mark3: 88)
        print(markA.mark1, markA.mark2, markA.mark3)
        
        let markB = MarkStudent.init(mark1: 33, mark2: 44, mark3: 55)
        print(markB.mark1, markB.mark2, markB.mark3)
        
        let weightA = WeightStudent()
        print(weightA.weight1)
        //自动生成变量名与参数相同的初始化方法
        var weightB = WeightStudent.init(weight1: 66, weight2: 77, weight3: 88)
        print(weightB.weight1)
        let weightC = weightB
        weightB.weight1 = 55
        print(weightB.weight1)
        print(weightC.weight1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

