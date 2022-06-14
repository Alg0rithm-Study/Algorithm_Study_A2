//
//  [Toni] Longest Consecutive Sequence.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/06/10.
//

import Foundation

class Solution33 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var answer = 0
        var set = Set(nums).sorted()
        
        for i in set {
            var result = 0
            var compare = i
            
            while set.contains(compare) {
                compare += 1
                set.removeFirst()
                result += 1
            }
            
            answer = max(answer, result)
        }
        
        return answer
    }
}


