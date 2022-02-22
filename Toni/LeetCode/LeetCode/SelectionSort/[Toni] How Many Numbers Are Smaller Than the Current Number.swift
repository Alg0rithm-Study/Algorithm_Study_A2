//
//  [Toni] How Many Numbers Are Smaller Than the Current Number.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/02/22.
//
/*
 주어진 배열속에서 자기자신보다 작은 원소들의 갯수를 리턴 // 별개로 어떻게하면 selection sort 알고리즘이랑 연관지어서 문제를 풀 수 있지?
 */
import Foundation

class Solution22 {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        
        for current in nums {
            result.append(compare(current: current, arr: nums)) //2. 빈배열에 결과 append
        }
        
        return result
    }
    
    func compare(current: Int, arr: [Int]) -> Int { // 1.현재 숫자와 배열을 비교, 작으면 카운트
        var count = 0
        
        for compare in arr {
            if current > compare {
                count += 1
            }
        }
        
        return count
    }
}
    
func selectionSort<Element: Comparable> (_ array: inout [Element]) {
    if array.count < 2 {
        return
    }
    
    for index in 0..<array.count {
        var minimumIdx = index
        
        for compare in index..<array.count {
            if array[index] > array[compare] {
                minimumIdx = compare
            }
        }
        
        array.swapAt(minimumIdx, index)
    }
}


