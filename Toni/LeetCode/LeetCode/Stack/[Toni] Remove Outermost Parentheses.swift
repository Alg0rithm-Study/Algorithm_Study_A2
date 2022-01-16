//
//  [Toni] Remove Outermost Parentheses.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/16.
//
/*
 가장 바깥 괄호를 제거하는 문제

 stack처럼 한개씩 괄호를 받을 때마다 count를 셈. (는 + )는 -. 어느 순간 모두 닫히게 되면 0이됨. 0이 되면 그 문자열의 앞과 뒤 바깥 괄호를 제거한 후 return. 그리고 스택을 비운 후 다시시작.
 */
class Solution12 {
    func removeOuterParentheses(_ s: String) -> String {
        var count = 0
        var stack: [Character] = []
        var answer = ""
        
        for c in s {
            if c == "(" {
                stack.append(c)
                count += 1

            } else if c == ")" {
                stack.append(c)
                count -= 1

            }
            
            if count == 0 {
                answer += removeParentheses(stack)
                stack.removeAll()

            }
        }
        
        return answer
    }
    
    func removeParentheses(_ stack: [Character]) -> String {
        var result = ""
       
        for c in stack {
            result += String(c)
        }
    
        result.removeFirst()
        result.removeLast()
  
        
        return result
    }
}
