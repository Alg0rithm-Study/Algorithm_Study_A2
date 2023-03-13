//
//  [Toni] Expiration Period.swift
//  Programmers
//
//  Created by Sunwoo on 2023/02/22.
//

import Foundation

func solution48(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termsDic: [String: Int] = [:]
    var result : [Int] = []
   
    for term in terms {
        let a = term.components(separatedBy: " ")
        termsDic[a[0]] = Int(a[1])!
    }
    
    var count = 0
    for privacy in privacies {
        count += 1
        let b = privacy.components(separatedBy: " ")
        let period = termsDic[b[1]]!
        
        var date = b[0].components(separatedBy: ".").map { Int($0)! }
        let add = (date[1] + period)
        let minus = date[2] - 1
        
        if add > 12 {
            date[0] += add / 12
            date[1] = add % 12
            if date[1] == 0 {
                date[0] -= 1
                date[1] = 12
            }
        } else {
            date[1] = add
        }
        
        if minus == 0 {
            date[2] = 28
            date[1] -= 1
            if date[1] == 0 {
                date[1] = 12
                date[0] -= 1
            }
        } else {
            date[2] = minus
        }
        
        if isExpired(today: today.components(separatedBy: ".").map{ Int($0)!}, expired: date) {
            result.append(count)
        }
    }
   
    print(result)
    
    return result
}

func isExpired(today: [Int], expired: [Int]) -> Bool {
    for i in 0..<today.count {
        if i == 2 {
            if today[i] > expired[i] {
                return true
            }
        }
        
        if today[i] > expired[i] {
            return true
        }
    }
    return false
}
