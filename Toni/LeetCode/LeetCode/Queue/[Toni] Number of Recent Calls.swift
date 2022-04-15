//
//  [Toni] Number of Recent Calls.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/19.
//
/*
 주어진 숫자를 통해 범위를 구하고 그 범위내에 해당하는 input값들의 개수를 return 하는 문제.
 */

import Foundation

class RecentCounter {
    var queue: [Int] = [] //범위에 들어올 queue

    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        queue.append(t) // 일단 값을 push
        
        for num in queue {              // queue의 처음부터 값을 조회
            if !(t-3000...t ~= num) {   // 첫값이 t-3000 ~ t 사이의 범위에 없을 경우. =  if (t-3000 <= num && num <= t)
                queue.removeFirst()     // 그 값은 제거
            } else {
                break                   //아니라면 for문을 탈출
            }
        }
    
        return queue.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
