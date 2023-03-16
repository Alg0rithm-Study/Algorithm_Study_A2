//
//  [Toni] Small String.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/16.
//

import Foundation

func solution60(_ t:String, _ p:String) -> Int {
    var tArr = Array(t)
    let intP = Int(p)!
    var count = 0
    
    for i in 0..<tArr.count - (p.count - 1){
        var temp = ""
        for j in i..<p.count + i {
            temp.append(tArr[j])
        }
        if intP >= Int(temp)! {
            count += 1
        }
    }
    
    return count
}
