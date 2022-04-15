//
//  main.swift
//  [Toni] Running Sum of 1d Array
//
//  Created by Sunwoo on 2022/01/07.
//
/*
 첫 요소부터 모두 더한값을 결과 배열에 차례대로 입력
 
 초기값에 0을 주고 차례대로 더한후 그값을 결과 배열에 append
 */

import Foundation


//1. 속도는 느리고, 메모리는 아낄수 있음
class Solution5 {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        var answer: [Int] = []

        nums.forEach { num in
            sum += num
            answer.append(sum)
        }
        return answer
    }
}

//2. 속도가 매우빠르지만, 메모리는 조금더 씀
//class Solution {
//    func runningSum(_ nums: [Int]) -> [Int] {
//        var sum = nums[0]
//        var answer = nums
//
//        for i in 1..<answer.count {
//            sum += nums[i]
//            answer[i] = sum
//        }
//        return answer
//    }
//}
