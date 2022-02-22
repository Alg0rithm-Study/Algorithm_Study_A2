//
//  [Toni] Minimum Sum of Four Digit Number After Splitting Digits.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/02/21.
//
/*
 각각의 숫자로 만들수있는 가장 작은 수 두개를 만들어서 결과를 리턴하는 문제. 가장 작은 숫자 2개가 10의 자리를 차지하면 될것이라고 생각.
 */

import Foundation

class Solution21 {
    func minimumSum(_ num: Int) -> Int {
        var number = num
        
        var arr = makeRemainder(of: &number) //숫자를 잘게 쪼개기 위해 10으로 나워서 나머지를 모두 return

        bubbleSort(&arr) // bubble sort를 이용하여 정렬 후
        
        let a = arr[0] * 10 + arr[2] * 1 // 가장 작은 두수는 10의자리, 그다음수는 1의자리로
        let b = arr[1] * 10 + arr[3] * 1 // 계산을 한뒤에 return
 
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






