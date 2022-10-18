//
//  [Toni] Budget.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/18.
//

import Foundation

func solution44(_ d:[Int], _ budget:Int) -> Int {
    let sorted = d.sorted()
    var answer = 0
    var money = budget
    
    for depart in sorted {
        if money >= depart {
            money -= depart
            answer += 1
        } else {
            break
        }
    }
    
    return answer
}
