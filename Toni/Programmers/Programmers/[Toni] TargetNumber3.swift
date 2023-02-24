//
//  TargetNumber3.swift
//  Programmers
//
//  Created by Sunwoo on 2023/02/24.
//

import Foundation

func solution53(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    func dfs(numbers: [Int] ,idx: Int, sum : Int) {
        if idx == numbers.count {
            if sum == target {
                answer += 1
            }
            return
        }

        dfs(numbers: numbers, idx: idx + 1, sum: sum + numbers[idx])
        dfs(numbers: numbers, idx: idx + 1, sum: sum - numbers[idx])
    }
    
    dfs(numbers: numbers, idx: 0, sum: 0)
    
    print(answer)
    
    return 0
}
