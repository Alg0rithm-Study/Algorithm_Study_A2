//
//  [Toni] Maximum Nesting Depth of the Parentheses.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/15.
//
/*
 괄호의 최대 depth를 계산해주는 문제. 괄호를 볼때마다 +1을 해주고 괄호가 닫히면 -1을 해주어 현재 괄호 상태를 나타낼 수 있음.
 max 라는 메서드를 사용하여, 가졌던 값들 중 최대값을 return
 */



import Foundation

class Solution11 {
    func maxDepth(_ s: String) -> Int {
        var stack:[Character] = []
        var depthCount = 0
        var result = 0
        
        for i in s {
            if i == "(" {
                stack.append(i)
                depthCount += 1
                result = max(depthCount, result)
            } else if i == ")" {
                stack.removeLast()
                depthCount -= 1
            }
        }
        return result
    }
}
