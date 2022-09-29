//
//  [Toni] joystick.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/28.
//

import Foundation

func solution39(_ name:String) -> Int {
    var answer = 0
    let center = Int(UnicodeScalar("M").value)
    let last = Int(UnicodeScalar("Z").value)
    
    for i in 0..<name.count {
        let index = name.index(name.startIndex, offsetBy: i)
        let ch = String(name[index])
        let value = Int(UnicodeScalar(ch)!.value)
        if value <= center {
            let result = value - center + 12
            print(result)
            answer += result
        } else {
            let result = abs(last - value) + 1
            print(result)
            answer += result
        }
    }
    
    var nameArr = name.map { String($0)}
    var count = name.count - 1
    
    for i in 0..<nameArr.count {
        if nameArr[i] != "A" {
            var nextIndex = i + 1
            while nextIndex < name.count && nameArr[nextIndex] == "A" {
                nextIndex += 1
            }
            
            let move = i * 2 + nameArr.count - nextIndex
            count = min(move, count)
        }
    }
    
    answer += count
    print(answer)
    
    
    //1 ABCDEFGHIJKLM 13
    //13(14) NOPQRSTUVWXYZ 1(26)
    //            7(20)
    return answer
}
