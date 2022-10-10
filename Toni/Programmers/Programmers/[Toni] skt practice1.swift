//
//  [Toni] skt practice1.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/08.
//

import Foundation

func solution41(_ nums: [Int]) -> Int {
    var answer = 0
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let number = nums[i] + nums[j] + nums[k]
                if isPrime(number: number) {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}

func isPrime(number: Int) -> Bool {
    if number < 4 {
        return number == 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}
