//
//  [Toni] Make Same Result Of Queues.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/05.
//

import Foundation

func solution41(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let queue1sum = queue1.reduce(0, +)
    let queue2sum = queue2.reduce(0, +)
    let sum = (queue1sum + queue2sum) / 2
    
    var position = 0
    
    for i in 0..<queue1.count {
        if queue1[i] > sum {
            return -1
        }
        
        if queue2[i] > sum {
            return -1
        }
        
        if queue1[i] == sum || queue2[i] == sum {
            position = i
        }
    }
    
    print(queue1sum)
    print(queue2sum)
    
    return -2
}
