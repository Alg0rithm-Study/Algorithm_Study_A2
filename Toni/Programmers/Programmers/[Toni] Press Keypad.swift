//
//  [Toni] Press Keypad.swift
//  Programmers 키패드 누르기
//
//  Created by Sunwoo on 2022/04/23.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]
    var left = 10
    var right = 11
    var answer = ""
    
    for number in numbers {
        if number == 1 || number == 4 || number == 7 {
            answer += "L"
            left = number
        } else if number == 3 || number == 6 || number == 9 {
            answer += "R"
            right = number
        } else {
            let middleIndex = findIndex(number: number, keypad: keypad)
            let leftIndex = findIndex(number: left, keypad: keypad)
            let rightIndex = findIndex(number: right, keypad: keypad)
            let leftToMiddle = abs(leftIndex[0] - middleIndex[0]) + abs(leftIndex[1] - middleIndex[1])
            let rightToMiddle = abs(rightIndex[0] - middleIndex[0]) + abs(rightIndex[1] - middleIndex[1])
            
            if leftToMiddle < rightToMiddle {
                answer += "L"
                left = number
            } else if rightToMiddle < leftToMiddle {
                answer += "R"
                right = number
            } else {
                if hand == "left" {
                    answer += "L"
                    left = number
                } else {
                    answer += "R"
                    right = number
                }
            }
        }
    }
    
    return answer
}

func findIndex(number: Int, keypad: [[Int]]) -> [Int] {
    var answer = [0,0]
    for i in 0..<keypad.count {
        for j in 0..<keypad[i].count {
            if keypad[i][j] == number {
                answer = [i,j]
                break
            }
        }
    }
    
    return answer
}
