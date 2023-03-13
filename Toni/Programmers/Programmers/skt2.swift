//
//  skt2.swift
//  Programmers
//
//  Created by Sunwoo on 2023/02/23.
//

import Foundation

func solution52(_ p:[Int], _ b:[Int]) -> [Int] {
    var people = p
    var boss = b
    var answer:[Int] = []
    var count = 0

    for oss in boss {
        if people[oss] != -1 {
            answer.append(0)
        } else {
            dfs(number: oss)
        }
    }
    
    func dfs(number: Int) {
        if people[number] == 0 {
            return
        }
        
       
        for _ in 0..<people.count {
            var index = people.firstIndex(of: number)
            var tmpidx = index
            
            if index != nil {
                index = tmpidx
                print(index!)
                people[index!] = 0
            } else {
                return
            }
            dfs(number: index!)
        }
    }
    
    
    
    return []
}
