//
//  ViewController.swift
//  下标脚本
//
//  Created by webplus on 17/10/10.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit
//语法

//        subscript(index:Int) -> Int{
//            get{
//               //get方法，用于下标脚本的声明
//            }
//            set(newValue){
//                //执行赋值操作
//            }
//        }
class ViewController: UIViewController {
    //定义(可以提供多个参数)
    subscript(index:Int) -> Int{
        return index
    }
    
    subscript(index1:Int, index2:Int) -> Int{
        return index1 + index2
    }
    var array:[Int] = [1,2,3,4,5]
    var dict:[String:Int] = ["1":1,"2":2,"3":3]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //结果为1,100
        let vc = ViewController()
        print(vc[1])
        print(vc[100])
        //结果为4
        print(vc[1,3])
        //去下标
        print(array[0])
        print(dict["3"]!)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

