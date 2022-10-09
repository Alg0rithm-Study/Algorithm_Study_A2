//
//  skt.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/09.
//

import Foundation

func solution(_ s:String, _ word_dict:[String]) -> Int {
    var str = ""
    var strArr:[String] = []
    var visited = Array(repeating: false, count: word_dict.count)
    var count = 0
    var answer = 0
    
    func dfs(c: Character) {
        if str.count > s.count {
            count = 0
            str = ""
            return
        } else {
            for i in 0..<word_dict.count {
                if word_dict[i].first! == c {
                    count += 1
                    strArr.append(word_dict[i])
                    visited[i] = true
                    let next = word_dict[i].last!
                    
                    dfs(c: next)
                    for k in 0..<strArr.count {
                        var temp = strArr[k]
                        if k != 0 {
                            temp.removeFirst()
                        }
                        
                        str += temp
                    }
                    print(str)
                    
                    if str == s {
                        answer = max(answer, count)
                        print("!")
                        return
                    }
                    
                    str = ""
                    strArr.removeLast()
                    visited[i] = false
                    count -= 1
                }
            }
        }
    }
    
    dfs(c: s.first!)
    print(answer)
    return answer
}
