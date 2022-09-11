//
//  [Toni] Decimal Game.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/11.
//

import Foundation

func solution31(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result: [String] = []
    var num = 0
    
    while result.count < (m * t) {
        let stringNum = String(num, radix: n)
        for c in stringNum {
            result.append(String(c.uppercased()))
        }
        num += 1
    }
    
    var answer = ""
    
    for i in stride(from: p-1, to: result.count, by: m) {
        answer.append(String(result[i]))
        if answer.count == t {
            break
        }
    }
    
    return answer
}

