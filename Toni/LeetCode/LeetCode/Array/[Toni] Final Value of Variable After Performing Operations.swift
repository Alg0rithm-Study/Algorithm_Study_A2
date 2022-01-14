//
//  main.swift
//  [Toni] Final Value of Variable After Performing Operations
//
//  Created by Sunwoo on 2022/01/07.
//
/*
 문자열에 --를 가지고 있으면 최초값 0에 -1을, ++를 가지고 있으면 +1을 더하고 결과 출력
 
 주어진 배열에서 forEach문으로 contain 메서드를 사용하여 -- 문자열을 가질 경우 값에서 -1을 ++를 가질경우 반대의 행위를 취해줌
 */


import Foundation

class Solution3 {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        
        var answer = 0

        operations.forEach { item in
            if item.contains("--") {
                answer -= 1
            } else if item.contains("++") {
                answer += 1
            }
        }
        
        return answer
    }
}
