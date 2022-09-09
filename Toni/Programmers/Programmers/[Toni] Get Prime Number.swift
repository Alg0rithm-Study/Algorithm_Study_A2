//
//  [Toni] Get Prime Number.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/09.
//

import Foundation

func solution25(_ n:Int, _ k:Int) -> Int {
    let stringNum = String(n, radix: k)
    var answer: [Int] = []
    
    print(stringNum)
    
    let numArr = stringNum.components(separatedBy: "0")
    
    print(numArr)
    
    for num in numArr {
        if num != "" {
            if isPrime(num: Int(num)!) {
                answer.append(Int(num)!)
            }
        }
    }
    
    return answer.count
}

func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
