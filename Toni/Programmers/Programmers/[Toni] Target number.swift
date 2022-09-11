//
//  [Toni] Target number.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/10.
//

import Foundation

var res: Int = 0 // target과 일치하는 경우의 수
var nums: [Int] = [] // 입력 받은 numbers 배열
var target_num: Int = 0 // 입력 받은 target 값

func dfs(idx: Int, len: Int, sum: Int){
    // 전체 배열을 돌았을 때 target 값과 sum이 같으면 경우의 수 1 증가
    if idx == len {
        if sum == target_num {
            res += 1
        }
        return
    }
    
    // 한 번은 더해주고 한 번은 빼주고
    dfs(idx: idx+1, len: len, sum: sum + nums[idx])
    dfs(idx: idx+1, len: len, sum: sum - nums[idx])
}

func solution28(_ numbers:[Int], _ target:Int) -> Int {
    for number in numbers {
        nums.append(number)
    }
    target_num = target
    
    dfs(idx: 0, len: numbers.count, sum: 0)
    
    return res
}
