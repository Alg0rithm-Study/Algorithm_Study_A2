//
//  main.swift
//  [Toni]  Concatenation of Array
//
//  Created by Sunwoo on 2022/01/07.
//
/*
 배열에 뒤에 해당배열을 한번더 나열하는 문제
 +를 해주면 됨
 
 공식문서 발췌
 Creating an Array by Adding Two Arrays Together
 You can create a new array by adding together two existing arrays with compatible types with the addition operator (+). The new array’s type is inferred from the type of the two arrays you add together
 
 var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
 // anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

 var sixDoubles = threeDoubles + anotherThreeDoubles
 // sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
 
 */

import Foundation

class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        let answer = nums + nums
        
        return answer
    }
}
