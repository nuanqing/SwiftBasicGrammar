//
//  ViewController.swift
//  循环与条件语句
//
//  Created by webplus on 17/9/19.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let a= 1 + 2//(在Swift中，运算符不能直接跟在变量或常量的后面)
//        let a = 1+ 2//(这是因为Swift认为到1+这个语句就结束了，2就是下一个语句)
        let numA = 32
        let numB = 42
        
        if numA > numB {
            print(numA)
            return
        }else{
            print(numB)
        }
        var numC = numA > numB ? numA : numB
        print(numC)
        
        numC = 44
        
        if numA < numB {
            if numB < numC {
                print(numC)
            }
        }
        //闭区间运算符
        for idx in 1...5 {
            print(idx)
        }
        //半开区间运算符
        for idx in 1..<5{
            print(idx)
        }
        let arr = ["1","2","3"]
        let dic = ["1":"2"]
        print(dic["1"]!)
        for item in arr {
            print(item)
        }
        //带下标
        for (idx,item) in arr.enumerated() {
            print(idx,item)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

