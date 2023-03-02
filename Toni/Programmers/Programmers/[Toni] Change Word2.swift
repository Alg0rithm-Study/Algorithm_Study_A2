//
//  [Toni] Change Word2.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/01.
//

import Foundation

func solution55(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answer = 200000000000
    var visited = Array(repeating: false, count: words.count)
    
    func dfs1(begin: String, target: String, count: Int) {
        if begin == target {
            if answer > count {
                answer = count
            }
            return
        } else {
            
   
        
        for i in 0..<words.count {
            if visited[i] == true {
                continue
            }
            
            if checkOnlyOne(first: begin, second: words[i]) {
                if words[i] == target {
                    visited[i] = false
                } else {
                    visited[i] = true
                }
                
                
                dfs1(begin: words[i], target: target, count: count + 1)
            }
        }
        }
    }
    
    dfs1(begin: begin, target: target, count: 0)
    
    
    print(answer)
    
    return 0
}

func checkOnlyOne(first: String, second: String) -> Bool {
    var firstString = first
    var secondString = second
    var count = 0
    
    while firstString.isEmpty {
        let ch1 = firstString.popLast()!
        let ch2 = secondString.popLast()!
        
        if ch1 == ch2 {
            count += 1
        }
        
        if count == 2 {
            break
        }
    }
    
    if count == 1 {
        return true
    }
    
    return false
}
