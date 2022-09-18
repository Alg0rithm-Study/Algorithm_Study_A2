//
//  [Toni] Cross Stepping Bridge.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/17.
//

import Foundation

func solution34(_ stones:[Int], _ k:Int) -> Int {
    var left = 1
    var right = 200000000
    
    while left < right {
        let mid = (left + right) / 2
        var count = 0
        print(mid)
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                count += 1
                
                if count >= k {
                    break
                }
            } else {
                count = 0
            }
        }
        
        if count >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}
