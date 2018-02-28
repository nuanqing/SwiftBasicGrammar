//
//  ViewController.swift
//  字典
//
//  Created by MacBook on 2017/9/24.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //注意：字典的存放不按照顺序
        //初始化字典
        let dict1 = ["1":"1","2":"2"]
        //实例化方法 name:[type,type] = [] 同数组
        let dict2:[Int:Int] = [1:1,2:2]
        let dict3:[Int:String] = [1:"2",2:"2"]
        let dict4:[Int:Any] = [1:1,2:"2"]
        let dict5 = [1:1,2:"2"] as [Int : Any]
        let dict6:Dictionary<Int,Any> = [1:1,2:"2"]
        //AnyObject 字符串进行转换成数字
        let dict7:[String:AnyObject] = ["1":2 as AnyObject,"2":"1" as AnyObject]
        
        //var dict1:Dictionary = ["name":"hjq","age":25.5] 废弃
        print(dict1,dict2,dict3,dict4,dict5,dict6,dict7)
        //数组字典
        let arr1:[[Int:Any]] = [[1:1,2:"2"],[1:"1",2:"2"]]
        print(arr1)
        
        //字典增删改查
        var dict8 = [1:2,2:2,3:3]
        //增
        dict8[4] = 4
        print(dict8)
        //字典的合并
        let dict9 = [2:2,4:4,5:5]
        for item in dict9 {
            dict8[item.key] = item.value
        }
        print(dict8)
        //删
        dict8.removeValue(forKey: 4)
        print(dict8)
        //改
        dict8[1] = 1
        print(dict8)
        //查 !表明确定有可选值，自动解析
        let key2:Int! = dict8[2]
        print(key2)
        //?表明有可选择，当读取的时候可以设定可选值，防止nil崩溃，也可以使用as Any，若没有设定可选值时，为nil，不会崩溃,此方法使用key4！强制解析会崩溃
        let key4:Int? = dict8[4]
        print(key4 as Any)
        
        //遍历字典
        for item in dict8 {
            //此方法同oc[NSString stringWithFormat:]
            print("\(item.key)的值为:\(item.value)")
        }
        for (key,value) in dict8 {
            print("\(key)的值为:\(value)")
        }
        
        self.sortOfSet()
    }
    
    func sortOfSet(){
        //创建一个整型的Set，并随机添加10个数字，然后将Set中的元素按顺序打印出来,会先比较字符串首字符，相同首字符会再比较第二位,以此类推,按照ascII码排序
        var set1 = Set<String>()
        set1.insert("1")
        set1.insert("3")
        set1.insert("2")
        set1.insert("4")
        set1.insert("5")
        set1.insert("8")
        set1.insert("7")
        set1.insert("6")
        set1.insert("9")
        set1.insert("10")
        
        for i in set1.sorted() {
            print(i)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

