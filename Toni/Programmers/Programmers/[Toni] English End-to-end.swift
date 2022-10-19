//
//  [Toni] English End-to-end.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/19.
//

import Foundation

func solution45(_ n:Int, _ words:[String]) -> [Int] {
    var set = Set<String>()
    var last = ""
    var first = ""
    var num = 0
    
    
    for i in 0..<words.count {
        let currentWord = words[i]
        set.insert(currentWord)

        if i != 0 {
            first = String(currentWord.first!)
            
            if first != last {
                num = i
                break
            }
        }
        
        if (i + 1) != set.count {
            num = i
            break
        }
        
        last = String(currentWord.last!)
    }
    
    if num == 0 {
        return [0,0]
    }
    
    let order = (num + 1) % n == 0 ? (num + 1) / n : (num + 1) / n + 1
    let person = (num + 1) % n == 0 ? n : (num + 1) % n
    
    return [person ,order]
}
