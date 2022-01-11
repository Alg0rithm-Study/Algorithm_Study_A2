//
//  main.swift
//  [Toni] Concatenation of Array
//
//  Created by Sunwoo on 2022/01/11.
//
/*
 같은 타입의 배열이 + 로 되있는 경우, 옆에 이어 붙여줄수있음
 */
import Foundation

class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        let answer = nums + nums
        
        return answer
    }
}
