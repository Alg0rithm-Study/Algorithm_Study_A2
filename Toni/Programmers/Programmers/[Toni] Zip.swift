//
//  [Toni] Zip.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/11.
//

import Foundation

func solution30(_ msg:String) -> [Int] {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var dict: [String: Int] = [:]
    var answer: [Int] = []
    
    for (i,c) in alphabet.enumerated() {
        dict[String(c)] = i+1
    }
    
    var last = 0
    var count = 0
    var add = 0
    for i in 0..<msg.count {
        count -= 1
        var newKey = ""
        if count >= 0 {
            continue
        }
        for j in i..<msg.count {
            let index = msg.index(msg.startIndex, offsetBy: j)
            newKey.append(String(msg[index]))
            if let _ = dict[newKey] {
                count += 1
                last = dict[newKey]!
            } else {
                dict[newKey] = 27 + add
                add += 1
                newKey.removeLast()
                answer.append(dict[newKey]!)
                last = dict[newKey]!
                break
            }
        }
    }
    
    answer.append(last)
    print(dict)
    print(answer)
    
    return []
}
