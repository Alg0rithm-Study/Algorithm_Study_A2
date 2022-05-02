//
//  [Toni] Secret Map.swift
//  Programmers 비밀지도
//
//  Created by Sunwoo on 2022/05/02.
//

import Foundation

func solution10(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var result1: [String] = []
    var result2: [String] = []
    
    for i in arr1 {
        var binary = String(i, radix: 2)
        while binary.count < n {
            binary = "0" + binary
        }
        result1.append(binary)
    }
    
    for i in arr2 {
        var binary = String(i, radix: 2)
        while binary.count < n {
            binary = "0" + binary
        }
        result2.append(binary)
    }
  
    for i in 0..<result1.count {
        var str = ""
        for j in 0..<result1[i].count {
            let index = result1[i].index(result1[i].startIndex, offsetBy: j)
            if result1[i][index] == result2[i][index] {
                if result1[i][index] == "1" {
                    str += "#"
                } else {
                    str += " "
                }
            } else {
                str += "#"
            }
        }
        answer.append(str)
    }
 
    return answer
}

