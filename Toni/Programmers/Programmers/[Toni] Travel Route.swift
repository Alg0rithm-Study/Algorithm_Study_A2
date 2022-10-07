//
//  [Toni] Travel Route.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/30.
//

import Foundation

func solution40(_ tickets:[[String]]) -> [String] {
    var visited = Array(repeating: false, count: tickets.count)
    var answer: [String] = []
    
    let tickets = tickets.sorted { $0[1] < $1[1] }
    
    func dfs(start: String) {
        if answer.count == tickets.count {
            answer.append(start)
            return
        }
        
        for i in 0..<tickets.count {
            if tickets[i][0] == start && !visited[i] {
                visited[i] = true
                answer.append(start)
                dfs(start: tickets[i][1])
                
                if answer.count == tickets.count + 1 {
                    return
                }
                
                answer.removeLast()
                visited[i] = false
            }
        }
    }
    
    dfs(start: "ICN")
    
    return answer
    
}
