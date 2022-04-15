//
//  [Toni] Remove All Adjacent Duplicates In String.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/17.
//
/*
 중간의 문자열이 중복이 된다면 서로 없어지는 문제. input을 받을때마다 스택에서 pop을 하여 비교후 다르면 넣어주고
 차례대로 스택에 넣어주고 같다면 아무행동도 취하지 않음.
 */


import Foundation

class Solution14 {
    func removeDuplicates(_ s: String) -> String {
        var stack: String = ""
        
        for c in s {
            if stack == "" {
                stack += String(c)
            } else {
                let comparsion = stack.removeLast()
                
                if c != comparsion {
                    stack += String(comparsion)
                    stack += String(c)
                }
            }
        }
        return stack
    }
}
