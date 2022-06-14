//
//  test1.swift
//  Programmers
//
//  Created by Sunwoo on 2022/06/12.
//

import Foundation

func solution17(_ p:[Int]) -> [Int] {
    var numbers = p
    var counts = Array(repeating: 0, count: numbers.count)
    
    for i in 0..<p.count {
        var small = 1001
        var index = i
        for j in i..<p.count {
            if small > numbers[j] {
                small = numbers[j]
                index = j
            }
        }
        
        if index != i {
            let temp = numbers[i]
            numbers[i] = numbers[index]
            numbers[index] = temp
            counts[i] += 1
            counts[index] += 1
        }
    }
    
    return counts
}

