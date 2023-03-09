//
//  [Toni] Change Word3.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/09.
//

import Foundation

func solution56(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    var queue: [String] = []
    var answer = 0
    
    queue.append(begin)
    
    while !queue.isEmpty {
        let first = queue.popLast()!
        if first == target {
            break
        }
        
        answer += 1
        for i in 0..<words.count {
            if !visited[i] {
                if checkSpell(first: first, second: words[i]) {
                    queue.append(words[i])
                    visited[i] = true
                }
            }
        }
    }
    
    return answer
}


func checkSpell(first: String, second: String) -> Bool {
    let firstArr = Array(first)
    let secondArr = Array(second)
    var count = 0
    
    for i in 0..<first.count {
        if firstArr[i] != secondArr[i] {
            count += 1
        }
        
        if count == 2 {
            return false
        }
    }
    
    return true
}
