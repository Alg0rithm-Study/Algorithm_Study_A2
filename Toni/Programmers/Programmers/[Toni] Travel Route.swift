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
    
    func findNext(city: String) -> Int {
        var dict: [String: Int] = [:]
        for i in 0..<tickets.count {
            if tickets[i][0] == city && visited[i] == false {
                dict.updateValue(i, forKey: tickets[i][1])
            }
        }
        
        if dict.isEmpty {
            return 0
        }
        
        let sorted = dict.sorted(by: <)
        let nextIndex = sorted.first!.value
        
        return nextIndex
    }
    
    func dfs(i: Int) {
        if !visited.contains(false) {
            return
        }

        visited[i] = true
        
        if !answer.isEmpty {
            answer.removeLast()
        }
        
        answer.append(tickets[i][0])
        answer.append(tickets[i][1])
        
        let nextIndex = findNext(city: tickets[i][1])
        
        dfs(i: nextIndex)
    }
    
    dfs(i: findNext(city: tickets[0][0]))
    
    print(answer)
    
    return answer
}
