//
//  [Toni] Minimum Sum of Four Digit Number After Splitting Digits.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/02/21.
//
/*
 각각의 숫자로 만들수있는 가장 작은 수 두개를 만들어서 결과를 리턴하는 문제.
 */

import Foundation

class Solution21 {
    func minimumSum(_ num: Int) -> Int {
        var number = num
        
        var arr = makeRemainder(of: &number)

        bubbleSort(&arr)
        
        let a = arr[0] * 10 + arr[2] * 1
        let b = arr[1] * 10 + arr[3] * 1
 
        return a + b
    }
    
    func makeRemainder(of num: inout Int) -> [Int] {
        var arr: [Int] = []
        
        while num / 10 != 0 {
            arr.append(num % 10)
            num = num/10
        }
        arr.append(num)
        
        return arr
    }
    
    func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
        if array.count < 2 {
            return
        }
        
        for end in (1..<array.count).reversed() {
            var swapped = false
            
            for current in 0..<end {
                if array[current] > array[current + 1] {
                    array.swapAt(current, current + 1)
                    swapped = true
                }
            }
            
            if swapped == false {
                return
            }
        }
    }
}






