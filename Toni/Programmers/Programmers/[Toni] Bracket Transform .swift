//
//  [Toni] Bracket Transform .swift
//  Programmers 괄호 변환
//
//  Created by Sunwoo on 2022/06/16.
//

import Foundation

func solution20(_ p:String) -> String {
    var arr = [Character]()
    
    for c in p {
        arr.append(c)
    }
    
    return String(make(arr: arr))
}

func make(arr: [Character]) -> [Character] {
    var array = arr
    var v = [Character]()
    var u = [Character]()
    var result = [Character]()
    
    if array.count == 0 {
        return array
    }
    
    var count = 0
    while true {
        let c = array.removeFirst()
        u.append(c)
        
        if c == "(" {
            count += 1
        } else {
            count -= 1
        }
        
        if count == 0 {
            v = array
            break
        }
    }
    
    if perfect(arr: u) {
        u += make(arr: v)
        result += u
    } else {
        result.append("(")
        result += make(arr: v)
        result.append(")")
        if u.count != 0 {
            u.removeFirst()
            u.removeLast()
        }
        
        for i in 0..<u.count {
            if u[i] == "(" {
                u[i] = ")"
            } else {
                u[i] = "("
            }
        }
        
        result += u
    }
    
    return result
}

func perfect(arr: [Character]) -> Bool {
    var stack = [Character]()
    
    for c in arr {
        if c == "(" {
            stack.append(c)
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    if !stack.isEmpty {
        return false
    }
    
    return true
}


