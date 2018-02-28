//
//  ViewController.swift
//  枚举
//
//  Created by webplus on 17/9/26.
//  Copyright © 2017年 sanyi. All rights reserved.
//

import UIKit
//一般写法
enum DaysofaWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}
//相关值
enum Student {
    case Name(String)
    case Mark(Int,Int,Int)
}
//原始值
//这里可以不赋值，从0开始，赋值为1从1开始
enum Month:Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, DeceMber
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //枚举简单的说也是一种数据类型，只不过是这种数据类型只包含自定义的特定数据，它是一组有共同特性的数据的集合。
        //语法
        enum enumname{
            //枚举定义
        }
        //和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
        //weekDay的类型可以在它被DaysofaWeek的一个可能值初始化时推断出来。一旦weekDay被声明为一个DaysofaWeek，你可以使用一个缩写语法（.）将其设置为另一个DaysofaWeek的值：
        var weekDay = DaysofaWeek.THURSDAY
        weekDay = .THURSDAY
        switch weekDay {
        case .Sunday:
            print("星期天")
        case .Monday:
            print("星期一")
        case .TUESDAY:
            print("星期二")
        case .THURSDAY:
            print("星期四")
        default:
            print("NONE")
        }
        //相关值：不同的数据类型，值的创建基于变量或常量，相关值是当你在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次当你这么做得时候，它的值可以是不同的。
        var _ = Student.Name("funnyJoker")
        let studMarks = Student.Mark(98, 97, 95)
        switch studMarks {
        case .Name(let stuName):
            print("学生的名字是:\(stuName)")
        case .Mark(let mark1, let mark2, let mark3):
            print("学生的成绩是:\(mark1),\(mark2),\(mark3)")
        }
        //原始值:相同数据类型,预先填充的值,原始值始终是相同的
        //原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。
        //在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。
        let yearMonth = Month.May.rawValue
        
        print(yearMonth)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

