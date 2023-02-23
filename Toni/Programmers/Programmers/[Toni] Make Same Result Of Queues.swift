//
//  [Toni] Make Same Result Of Queues.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/05.
//

import Foundation

func solution49(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let array = queue1 + queue2
    var left = 0
    var right = queue1.count
    var count = 0
    
    var queue1Sum = queue1.reduce(0, +)
    let queue2Sum = queue2.reduce(0, +)
    let goal = (queue1Sum + queue2Sum) / 2
    
    if (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    }
    
    while right<array.count && left <= right {
        if queue1Sum < goal {
            queue1Sum += array[right]
            right += 1
        } else if queue1Sum > goal {
            queue1Sum -= array[left]
            left += 1
        } else {
            break
        }
        count += 1
    }
    
    if queue1Sum != goal {
        return -1
    }
    
    return count
}
