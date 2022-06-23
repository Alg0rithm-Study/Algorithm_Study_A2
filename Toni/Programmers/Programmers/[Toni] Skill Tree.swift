//
//  [Toni] Skill Tree.swift
//  Programmers
//
//  Created by Sunwoo on 2022/06/23.
//

import Foundation

func solution21(_ skill:String, _ skill_trees:[String]) -> Int {
    var char = [Character]()
    var count: [[Character]] = []
    var answer = 0
    
    for c in skill {
        char.append(c)
    }
    
    for skill_tree in skill_trees {
        var tmp = [Character]()
        var flag = false
        for c in skill_tree {
            if char.contains(c) {
                tmp.append(c)
                flag = true
            }
        }
        if tmp.count != 0 {
            count.append(tmp)
            tmp = []
        }
        
        if flag == false {
            answer += 1
        }
    }
    
    if count.count != 0 {
        for order in count {
            var flag = true
            for i in 0..<order.count {
                if order[i] != char[i] {
                    flag = false
                    break
                }
            }
            
            if flag {
                answer += 1
            }
        }
    }
    
    print(answer)
    
    return answer
}
