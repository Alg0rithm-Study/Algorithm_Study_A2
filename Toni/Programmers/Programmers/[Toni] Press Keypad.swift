//
//  [Toni] Press Keypad.swift
//  Programmers 키패드 누르기
//
//  Created by Sunwoo on 2022/04/23.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]                                                    // 좌표를 위한 배열
    var left = 10                                                                                       // 처음 값 사실 *
    var right = 11                                                                                      // 처음 값 사실 #
    var answer = ""
    
    for number in numbers {
        if number == 1 || number == 4 || number == 7 {                                                  // 기존에 find 함수를 돌렸지만 이중포문이라서
            answer += "L"                                                                               // 간단하게 바꿔줌
            left = number
        } else if number == 3 || number == 6 || number == 9 {
            answer += "R"
            right = number
        } else {                                                                                        // 해당 숫자가 2,5,8,0 일경우
            let middleIndex = findIndex(number: number, keypad: keypad)                                 // 가운데 숫자의 좌표를 구함
            let leftIndex = findIndex(number: left, keypad: keypad)                                     // 왼손의 좌표도 구함
            let rightIndex = findIndex(number: right, keypad: keypad)                                   // 오른손의 좌표도 구함
            let leftToMiddle = abs(leftIndex[0] - middleIndex[0]) + abs(leftIndex[1] - middleIndex[1])  // 좌표들 사이의 거리를 구함 feat. 절대값
            let rightToMiddle = abs(rightIndex[0] - middleIndex[0]) + abs(rightIndex[1] - middleIndex[1])
            
            if leftToMiddle < rightToMiddle {                                                           // 누가 더 큰 지 비교
                answer += "L"
                left = number
            } else if rightToMiddle < leftToMiddle {
                answer += "R"
                right = number
            } else {                                                                                    // 같을 때는
                if hand == "left" {                                                                     // 왼손잡이면
                    answer += "L"
                    left = number
                } else {
                    answer += "R"                                                                       // 오른손잡이면
                    right = number
                }
            }
        }
    }
    
    return answer
}

func findIndex(number: Int, keypad: [[Int]]) -> [Int] {                                                    // 이중 배열에서 해당 값의 인덱스를 찾는 메서드
    var answer = [0,0]
    for i in 0..<keypad.count {                                                                            // keypad의 높이? 만큼
        for j in 0..<keypad[i].count {                                                                     // 그 안에 있는 배열의 원소만큼
            if keypad[i][j] == number {
                answer = [i,j]
                break
            }
        }
    }
    
    return answer
}
