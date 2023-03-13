//
//  skt1.swift
//  Programmers
//
//  Created by Sunwoo on 2023/02/23.
//

import Foundation

func solution51(_ bakery_schedule:[String], _ current_time:String, _ k: Int) -> Int {
    let time = current_time.components(separatedBy: ":").map { Int($0)! }
    let current = time[0] * 60 + time[1]
    var totalCount = k
    
    for bSchedule in bakery_schedule {
        let schedule = bSchedule.components(separatedBy: " ")
        let time = schedule[0].components(separatedBy: ":").map { Int($0)! }
        let breadTime = time[0] * 60 + time[1]
        
        if current > breadTime {
            continue
        }
        
        let count = Int(schedule[1])!
        var currentCount = totalCount - count
        
        if currentCount <= 0 {
            print(breadTime - current)
            return breadTime - current
        }
        
        totalCount = currentCount
    }
    
    return -1
}

