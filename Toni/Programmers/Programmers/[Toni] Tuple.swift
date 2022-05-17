//
//  [Toni] Tuple.swift
//  Programmers 튜플
//
//  Created by Sunwoo on 2022/05/17.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var tuple = s
    tuple.removeFirst()
    tuple.removeLast()
  
    var result: [[Int]] = []
    var mini: [Int] = []
    var str = ""
    var answer: [Int] = []
    
    tuple.forEach { c in
        if c == "," && !str.isEmpty {
            mini.append(Int(str)!)
            str = ""
        }
        
        if c == "}" {
            mini.append(Int(str)!)
            str = ""
            result.append(mini)
            mini = []
        }
        
        if c.isNumber {
            str += String(c)
        }
    }
    
    for i in 1...result.count {
        for j in 0..<result.count {
            if result[j].count == i {
                for num in result[j] {
                    if !answer.contains(num) {
                        answer.append(num)
                        break
                    }
                }
            }
        }
    }
    
    return answer
}
