//
//  [Toni] Dart Game.swift
//  Programmers 다트 게임
//
//  Created by Sunwoo on 2022/04/17.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    var dart = dartResult
    let score = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let option = ["S", "D", "T"]
    //let sign = ["*", "#"]
    var result: [Int] = []
    
    while dart.count > 0 {
        let first = String(dart.removeFirst())
        
        if score.contains(first) {
            if first == "1" {
                if score.contains(String(dart.first!)) {
                    dart.removeFirst()
                    result.append(getScore(num: "10"))
                } else {
                    result.append(getScore(num: first))
                }
            } else {
                result.append(getScore(num: first))
            }
        } else if option.contains(first) {
            let last = result.removeLast()
            result.append(getBonus(bonus: first, score: last))
        } else {
            result = getOption(option: first, scoreArr: result)
        }
    }
    
    let answer = result.reduce(into: 0) { sum, n in
        sum += n
    }
    
    return answer
}

func getScore(num: String) -> Int {
    let answer = Int(num)!
    
    return answer
}

func getBonus(bonus: String, score: Int) -> Int {
    var answer = score
    
    if bonus == "D" {
        answer = answer * answer
    } else if bonus == "T" {
        answer = answer * answer * answer
    }
    
    return answer
}

func getOption(option: String, scoreArr: [Int]) -> [Int] {
    var scores = scoreArr
    if scores.count == 1 {
        if option == "*" {
            scores[0] = scores[0] * 2
        } else if option == "#" {
            scores[0] = scores[0] * -1
        } else {
            
        }
    } else {
        let lastIndex = scores.count - 1
        if option == "*" {
            scores[lastIndex-1] = scores[lastIndex-1] * 2
            scores[lastIndex] = scores[lastIndex] * 2
        } else if option == "#" {
            scores[lastIndex] = scores[lastIndex] * -1
        } else {
            
        }
    }
    
    return scores
}
