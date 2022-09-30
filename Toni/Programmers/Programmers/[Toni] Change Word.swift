//
//  [불고기] Change Word.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/28.
//

import Foundation

func solution38(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answer = 0
    var visited = Array(repeating: false, count: words.count)
    
    func dfs(begin: String, count: Int) {
        if begin == target {
            answer = answer > count ? count : answer
            return
        } else {
        
        for i in 0..<words.count {
            if visited[i] == true {
                continue
            }
            
            if checkOne(first: begin, second: words[i]) {
                visited[i] = words[i] == target ? false : true
                dfs(begin: words[i], count: count + 1)
            }
        }
    }
    }
    dfs(begin: begin, count: 0)
    print(answer)
    
    
    return 0
}

func checkOne(first: String, second: String) -> Bool {
    var count = 0
    for i in 0..<first.count {
        let index = first.index(first.startIndex, offsetBy: i)
        
        if first[index] == second[index] {
            count += 1
        }
        
        if count == 2 {
            return false
        }
    }
    
    return true
}
