//
//  [Toni] Personality Test.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/07.
//

import Foundation

func solution23(_ survey:[String], _ choices:[Int]) -> String {
    var MBTI: [Character: Int] = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    
    for i in 0..<survey.count {
        let score = choices[i]
        if score == 4 {
            
        } else if score > 4 {
            MBTI[survey[i].last!]! += (score - 4)
        } else {
            MBTI[survey[i].first!]! += (score - 4) * -1
        }
    }
    
    var answer = ""
    let char: [Character] = ["R", "T", "C", "F", "J", "M", "A", "N"]
    
    for i in stride(from: 0, to: char.count-1, by: 2) {
        if MBTI[char[i]]! >= MBTI[char[i+1]]! {
            answer += String(char[i])
        } else {
            answer += String(char[i+1])
        }
    }
    
    return answer
}
