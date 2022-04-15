//
//  [Toni] Build an Array With Stack Operations.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/17.
//
/*
 문제의 핵심 : n번째 수까지 target을 어떻게 만들었는지 과정을 나타냄.
 */


import Foundation

class Solution15 {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var number = 1 // target에 값이 들어있나 검사를 하게 될 값
        var pushCount = 0 // n에 도달하기전 결과가 built 될 수 있으므로, push의 count를 세줌
        var answerArr: [String] = [] // 결과배열
        
        while pushCount < target.count { // pushCount가 target의 count보다 작으면 계속 반복
            if target.contains(number) { // target에 number가 들어있는지 검사
                answerArr.append("Push")
                pushCount += 1          // push를 했으므로 count
            } else {                    // 값이 없으면
                answerArr.append("Push")
                answerArr.append("Pop") // push and pop
            }
            
            number += 1                 // 제약조건에서 숫자는 차례대로 증가하므로 number + 1
        }
    
        return answerArr
    }
}
