//
//  ViewController.swift
//  数组
//
//  Created by webplus on 17/9/22.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化数组
        let arr0 = [1,2,3]
        //name:type 明确类型写法
        let arr1:Array = [1,2,3]
        let arr2:[Int] = [1,2,3]
        let arr3:Array<Int> = [1,2,3]
        print(arr0,arr1,arr2,arr3)
        
        //创建空数组
        //数组字典不能 let name = [] 无法确定数组或字典
        let arr5 = [Int]()
        //明确类型写法
        let arr6:[Int] = []
        let arr7:Array<Int> = []
        let arr8:[String] = [String]()
        print(arr5,arr6,arr7,arr8)
        
        //元素类型
        let arr10 = [1,"2",3.14] as [Any]
        //明确类型
        let arr11:Array<Any> = [1,"2",3.14]
        var arr12:Array = [1,"2",3.14] as [Any]
        
        print(arr10,arr11,arr12)
        
        //获取数组的长度
        print(arr12.count)
        //数组是否为空
        print(arr12.isEmpty,arr6.isEmpty)
        
        //数组追加
        arr12.append(4)
        print(arr12)
        arr12 += [5]
        print(arr12)
        arr12 += arr12
        print(arr12)
        //借助自身追加，范围0-1，追加2个元素:
        //[1, "2", 3.1400000000000001, 4, 5, 1, "2", 3.1400000000000001, 4, 5, 1, "2"]
        arr12 += arr12[0...1]
        print(arr12)
        
        //数组插入
        var arr13 = [1,2,4] as [Any]
        arr13.insert("3", at: 2)
        print(arr13)
        
        //重新赋值
        arr13[2] = 3
        print(arr13)
        
        //删除
        arr13.remove(at: 0)
        arr13.removeLast()
        print(arr13)
        arr13.removeFirst()
        print(arr13)
        arr13.removeAll()
        print(arr13)
        
        //从某个区间删除
        var arr14 = [1,2,3,4]
        arr14.removeSubrange(1...2)
        print(arr14)
        
        //从某个区间替换为某个数组
        var arr15 = [1,2,3,4]
        //此时arr15.count = 3 [1,5,4]
        arr15.replaceSubrange(1...2, with: [5])
        print(arr15)
        //此时arr15.count = 1 [5]
        arr15.replaceSubrange(0...2, with: [5])
        print(arr15)
        
        //遍历数组
        var arr16 = [1,2,3,4]
        //遍历是可以控制区间范围
        for item in arr16[0..<2] {
            print(item)
        }
        
        
        // 其实Range就是半闭区间
        let range = 0...5
        print(range) // 通过答应也可以推断出类型
        //6个元素
        print(range.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

