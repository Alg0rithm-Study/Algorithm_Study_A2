//
//  [Toni] Maximum Product of Two Elements in an Array.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/04/06.
//

import Foundation

class Solution27 {
    func maxProduct(_ nums: [Int]) -> Int {
        var numbers = nums
        let maxValue = numbers.max()! // 최대값 추출
        let index = numbers.firstIndex(of: maxValue)! // 최대값의 인덱스
        
        numbers.remove(at: index) // 인덱스를 배열에서 제거
        //let numbers = nums.filter { $0 != maxValue } 처음엔 필터썼는데 동일한 값이 있는 경우 제거가 되는 문제 발생
        
        let nextValue = numbers.max()! // 그다음값 추출
        
        return (maxValue - 1) * (nextValue - 1)
    }
}
