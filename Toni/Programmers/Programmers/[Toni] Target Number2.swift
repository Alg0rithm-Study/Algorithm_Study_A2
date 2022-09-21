//
//  [Toni] Target Number2.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/21.
//

import Foundation

func solution35(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    
    func dfs(idx: Int, len: Int, sum: Int) {
        if idx == len {
            if sum == target {
                answer += 1
            }
            
            return
        }
        
        dfs(idx: idx + 1, len: len, sum: sum + numbers[idx])
        dfs(idx: idx + 1, len: len, sum: sum - numbers[idx])
    }
    
    dfs(idx: 0, len: numbers.count, sum: 0)
    print(answer)
    
    
    return 0
}
