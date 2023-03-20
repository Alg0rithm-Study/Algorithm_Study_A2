//
//  [Toni] Failure rate2.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/13.
//

import Foundation

func solution58(_ N:Int, _ stages:[Int]) -> [Int] {
    var stages = stages
    var dict: [(Int, Double)] = []
    
    for i in 1...N {
        let total = Double(stages.count)
        var count:Double = 0
        var index = 0
        
        for item in stages {
            if item == i {
                stages.remove(at: index)
                count += 1
                index -= 1
            }
            index += 1
        }
        dict.append((i,count == 0.0 ? 0.0 : count/total))
        //dict.updateValue(count == 0.0 ? 0.0 : count/total, forKey: i)
    }
    let sorted = dict.sorted {
        $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }
    var answer: [Int] = []
    for (key, _) in sorted {
        answer.append(key)
    }
    
    //print(sorted)
    

    return answer
}
