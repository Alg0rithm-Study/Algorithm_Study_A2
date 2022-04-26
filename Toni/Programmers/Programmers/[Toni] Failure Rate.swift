//
//  [Toni] Failure Rate.swift
//  Programmers 실패율
//
//  Created by Sunwoo on 2022/04/26.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var level = stages
    var fail: [(Int,Double)] = []
    var answer: [Int] = []
    
    for i in 1...N {
        var userCount = 0.0
        while level.contains(i) {
            let user = level.firstIndex(of: i)
            level.remove(at: user!)
            userCount += 1
        }
        
        fail.append((i, userCount / (Double(level.count) + userCount)))
    }
    
    //let rfail = fail.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }
    
    let result = fail.sorted { $0.1 > $1.1 }
    print(result)
    for (key,_) in result {
        answer.append(key)
    }
    
    return answer
}
