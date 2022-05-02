//
//  [Toni] Failure Rate.swift
//  Programmers 실패율
//
//  Created by Sunwoo on 2022/04/26.
//

import Foundation

func solution8(_ N:Int, _ stages:[Int]) -> [Int] {
    var level = stages
    var fail: [(Int,Double)] = []
    var answer: [Int] = []
    
    //stages의 수가 20만이 넘게 들어오는 경우 루프를 계속 돌아야함.. 스테이지 수를 점차 줄이던가, 아니면 레벨별로 담아서 돌리던가 둘 중 하나를 채택하는 방식으로 해야함.
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
