//
//  [Toni] Travel Route2.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/10.
//

import Foundation

func solution57(_ tickets:[[String]]) -> [String] {
    var visited = Array(repeating: false, count: tickets.count - 1)
    var stack: [[String]] = []
    var answer: [String] = []

    var first = tickets.first!
    var index = 0
    
    for i in 0..<tickets.count {
        if first[0] == tickets[i][0] {
            if first[0] > tickets[i][1] {
                first = tickets[i]
                index = i
            }
        }
    }
    var ticket = tickets
    ticket.remove(at: index)
    stack.append(first)
    
    let sortedTickets = ticket.sorted(by: { $0[1] > $1[1] })

    while !stack.isEmpty {
        let last = stack.popLast()!
        
        if answer.isEmpty {
            answer.append(last[0])
            answer.append(last[1])
        } else {
            answer.append(last[1])
        }
        
        for i in 0..<ticket.count {
            if !visited[i] {
                if last[1] == sortedTickets[i][0] {
                    stack.append(sortedTickets[i])
                    visited[i] = true
                }
            }
        }
    }
    
    print(answer)
    return answer
}
