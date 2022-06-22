//
//  test2.swift
//  Programmers
//
//  Created by Sunwoo on 2022/06/12.
//

import Foundation

func solution18(_ periods:[Int], _ payments:[[Int]], _ estimates:[Int]) -> [Int] {
    var thisMonth = Array(repeating: 0, count: periods.count)
    var nextMonth = Array(repeating: 0, count: periods.count)

    for i in 0..<periods.count {
        let totalPay = payments[i].reduce(0, +)
        
        if periods[i] < 24 {
            thisMonth[i] = 0
            continue
        }
        
        if totalPay < 600000 {
            thisMonth[i] = 0
            continue
        }
        
        if periods[i] >= 24 && totalPay >= 900000 {
            thisMonth[i] = 10
            continue
        }
        
        if periods[i] >= 60 && totalPay >= 600000 {
            thisMonth[i] = 10
            continue
        }
    }
    
    for i in 0..<periods.count {
        let totalPay = payments[i].reduce(0, +) - payments[i][0] + estimates[i]
        
        if periods[i] < 23 {
            nextMonth[i] = 0
            continue
        }
        
        if totalPay < 600000 {
            nextMonth[i] = 0
            continue
        }
        
        if periods[i] >= 23 && totalPay >= 900000 {
            nextMonth[i] = 10
            continue
        }
        
        if periods[i] >= 59 && totalPay >= 600000 {
            nextMonth[i] = 10
            continue
        }
    }
    
    var answer = Array(repeating: 0, count: 2)
    for i in 0..<thisMonth.count {
        if thisMonth[i] - nextMonth[i] == -10 {
            answer[0] += 1
        } else if thisMonth[i] - nextMonth[i] == 10 {
            answer[1] += 1
        }
    }
    
    return answer
}
