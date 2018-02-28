//
//  ViewController.swift
//  字符串
//
//  Created by webplus on 17/9/22.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //使用字面量创建字符串
        let stringA = "hello world"
        //实例化字符串
        let stringB = String("hello world")
        print(stringA,stringB!)
        
        //你可以使用空的字符串字面量赋值给变量或初始化一个String类的实例来初始值一个空的字符串。 我们可以使用字符串属性 isEmpty 来判断字符串是否为空
        //使用字面量创建空的
        let stringC = ""
        if stringC.isEmpty {
            print("stringC的值:\(stringC)")
        }
        
        let stringD = String()
        if stringD.isEmpty {
            print("stringD的值:\(stringD)")
        }
        //增加字符串 (变量可以加，常量不能加)
        var stringF = "hello"
        stringF = stringF + "world"
        stringF += " time"
        stringF.append(stringB!)
        stringF.append("F")
        //字符串插入方式
        stringF = "\(stringF)\(stringA)hello world"
        //输出字符串及长度
        print("\(stringF)的长度为:\(stringF.characters.count)")
        
        //判断字符串内容是否相等
        let AisEquaB:Bool = stringA == stringB!
        if stringA == stringB! {
            print("A与B字符串相等")
        }
    
        print(AisEquaB)
        print(stringA == stringB! ? stringA :stringB!)
        
        //Unicode 是一个国际标准，用于文本的编码，Swift 的 String 类型是基于 Unicode建立的。utf8 or utf16
        let stringG = "河南省郑州市"
        for item in stringG.utf8 {
            print(item)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

