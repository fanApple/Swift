//
//  YJSet.swift
//  SwiftBasics
//
//  Created by yangjun on 15/10/26.
//  Copyright © 2015年 六月. All rights reserved.
//

import Foundation

class YJSet: NSObject, TestProtocol {

    func test() {
//        self.testInit() // 初始化
//        self.testProperties() // 相关属性
//        self.testFindingObjects() // 查找元素
//        self.testAddAndRemove() // 增加和删除
//        self.testCombiningAndRecombining() // 结合和重组
//        self.testSort() // 排序
    }
    
    // MARK: 初始化
    private func testInit() {
        // 空Set
        var set = Set<String>()
        set = []
        // 通过参数创建
        set = Set(["阳君","937447974"])
        set = Set(arrayLiteral: "阳君","937447974")
        let set2:Set<String> = ["阳君","937447974"]
        print("\(set2)")
        // 通过Set创建
        set = Set(set)
        print("\(set)")
    }
    
    // MARK: 相关属性
    private func testProperties() {
        let set:Set<String> = ["阳君", "937447974", "swift"]
        print("count:\(set.count)") // 有多少个元素
        print("first:\(set.first)") // 顶部元素
        print("isEmpty:\(set.isEmpty)") // 是否为空
        print("hashValue:\(set.hashValue)") // hash值
        // 首位和末位
        var index = set.startIndex
        index = set.endIndex
        print("index:\(index)")
    }
    
    // MARK: 查找元素
    private func testFindingObjects() {
        let set:Set<String> = ["阳君", "937447974", "swift"]
        print("contains:\(set.contains("阳君"))") // 是否存在这个元素
        // 查找位置
        var index = set.indexOf("阳君")
        index = set.indexOf { (str) -> Bool in
            return "阳君" == str
        }
        let str = set[index!] // 根据位置获取元素
        print("str:\(str)")
        // 遍历输出
        // 无序输出
        for item in set {
            print("item:\(item)")
        }
        // 有序输出
        for item in set.sort() {
            print("item:\(item)")
        }
    }
    
    // MARK: 增加和删除
    private func testAddAndRemove() {
        var set:Set<String> = ["阳君", "937447974", "swift"]
        set.insert("IOS") // 增加
        var str = set.remove("IOS") // 删除指定元素, 并返回删除的元素
        str = set.removeAtIndex(set.indexOf("阳君")!) // 根据位置删除
        str = set.removeFirst() // 删除首个
        set.removeAll() // 删除所有
        print("str:\(str)")
    }
    
    // MARK: 结合和重组
    private func testCombiningAndRecombining() {
        let a:Set<String> = ["阳君", "937447974", "swift"]
        let b:Set<String> = ["IOS", "937447974", "swift"]
        let c:Set<String> = ["阳君", "937447974", "swift", "IOS"]
        print("isEqual:\(a == b)") // 是否相等
        print("isSubsetOf:\(a.isSubsetOf(c))") // a是否是c的子集
        print("isSupersetOf:\(c.isSupersetOf(a))") // a是否是c的子集
        var set = a.intersect(b) // a交c,返回新set;["937447974", "swift"]
        set = a.union(b)         // a并b;["阳君", "937447974", "swift", "IOS"]
        set = a.subtract(b)      // a差b,即a-a交b;["阳君"]
        set = a.exclusiveOr(b)   // a并b-a交b;["阳君", "IOS"]
        // 不返回结果集，直接修改前set
        set.intersectInPlace(b)   // set交b,结果在set中
        set.unionInPlace(b)       // a并b
        set.subtractInPlace(b)    // a差b,即a-a交b
        set.exclusiveOrInPlace(b) // a并b-a交b
    }
    
    // MARK: 排序
    private func testSort() {
        let set:Set<String> = ["阳君", "937447974", "swift", "IOS", "837447974",]
        var array = set.sort() // 排序，升序
        array = set.sort { (str1, str2) -> Bool in
            return str1 < str2
        }
        // 简写
        array = set.sort({ str1,str2 in str1 < str2 })
        array = set.sort({$0 > $1})
        array = set.sort(>)
        print("\(array)")
    }
    
}
