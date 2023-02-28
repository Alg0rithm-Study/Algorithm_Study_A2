//
//  [Toni] Network.swift
//  Programmers
//
//  Created by Sunwoo on 2023/02/27.
//

import Foundation

func solution54(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: computers.count)
    var answer = 0
    
    func dfs(i: Int) {
        if visited[i] == true {
            return
        }
        
        visited[i] = true
        
        for j in 0..<computers[i].count {
            if computers[i][j] == 1 {
                dfs(i: j)
            }
        }
    }
    
    for i in 0..<computers.count {
        if visited[i] == true {
            continue
        }
        answer += 1
        dfs(i: i)
    }
    
    print(answer)
    
    
    return 0
}
