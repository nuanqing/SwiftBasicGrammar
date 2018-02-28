//
//  ViewController.swift
//  访问控制
//
//  Created by webplus on 17/10/16.
//  Copyright © 2017年 sanyi. All rights reserved.
//
//Swift 访问控制
//访问控制可以限定其他源文件或模块中代码对你代码的访问级别。
//你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类型的属性、函数、初始化方法、基本类型、下标索引等设置访问级别。
//协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数。
//访问控制基于模块与源文件。
//模块指的是以独立单元构建和发布的 Framework 或 Application。在 Swift 中的一个模块可以使用 import 关键字引入另外一个模块。
//源文件是单个源码文件，它通常属于一个模块， 源文件可以包含多个类和函数 的定义。


//Swift 为代码中的实体提供了四种不同的访问级别:public、internal、fileprivate、private。
//public	可以访问自己模块中源文件里的任何实体，别人也可以通过引入该模块来访问源文件里的所有实体。
//internal	可以访问自己模块中源文件里的任何实体，但是别人不能访问该模块中源文件里的实体。
//fileprivate	文件内私有，只能在当前源文件中使用。
//private	只能在类中访问，离开了这个类或者结构体的作用域外面就无法访问。

//类的访问控制
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}
//属性的访问控制
public var somePublicVariable = 0
internal let someInternalConstant = 0
//方法的访问控制
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

//默认的访问级别为internal
class SomeClass {}              // 访问级别为 internal
let someConstant = 0            // 访问级别为 internal


//子类访问权限
//子类的访问级别不得高于父类的访问级别。如:父类的访问级别是internal，子类的访问级别就不能申明为public。

//协议访问权限
//如果想为一个协议明确的申明访问级别，那么需要注意一点，就是你要确保该协议只在你申明的访问级别作用域中使用。
//如果你定义了一个public访问级别的协议，那么实现该协议提供的必要函数也会是public的访问级别。这一点不同于其他类型，比如，public访问级别的其他类型，他们成员的访问级别为internal。

//扩展访问权限
//你可以在条件允许的情况下对类、结构体、枚举进行扩展。扩展成员应该具有和原始类成员一致的访问级别。比如你扩展了一个公共类型，那么你新加的成员应该具有和原始成员一样的默认的internal访问级别。
//你可以明确申明扩展的访问级别（比如使用private extension）给该扩展内所有成员申明一个新的默认访问级别。这个新的默认访问级别仍然可以被单独成员所申明的访问级别所覆盖。

//类型别名
//任何你定义的类型别名都会被当作不同的类型，以便于进行访问控制。一个类型别名的访问级别不可高于原类型的访问级别。
//一个private级别的类型别名可以设定给一个public、internal、private的类型，但是一个public级别的类型别名只能设定给一个public级别的类型，不能设定给internal或private 级别的类型。

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

