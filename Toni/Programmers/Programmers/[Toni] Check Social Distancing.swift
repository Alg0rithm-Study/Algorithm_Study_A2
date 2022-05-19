//
//  [Toni] Check Social Distancing.swift
//  Programmers 거리두기 확인하기
//
//  Created by Sunwoo on 2022/05/15.
//

import Foundation

func solution13(_ places:[[String]]) -> [Int] {
    var answer: [Int] = []
    var count = 0
    
    for place in places {
        let position = findPosition(place: place)
        var danger = calculateDistance(position: position)
        if !position.isEmpty && danger.isEmpty {
            answer.append(0)
            count += 1
            continue
        }
        //[[0,3] [1,2] / [4,3] [4,4]]
        for i in 0..<danger.count where i % 2 == 0 {
            if danger[i][0] == danger[i+1][0] {
                let index = place[danger[i][0]].index(place[danger[i][0]].startIndex, offsetBy: danger[i][1]+1)
                let a = place[danger[i][0]][index]
                if a == "O" {
                    answer.append(0)
                    break
                }
            } else if danger[i][1] == danger[i+1][1] {
                let index = place[danger[i][0]].index(place[danger[i][0]].startIndex, offsetBy: danger[i][0]) // 2,2 = P
                let a = place[danger[i][0]+1][index]
                if a == "O" {
                    answer.append(0)
                    break
                }
            } else {
                let tmp = danger[i][0] //
                danger[i][0] = danger[i+1][0]
                danger[i+1][0] = tmp
                // 0,3 1,2 -> 1,3 0,2
                let firstIndex = place[danger[i][0]].index(place[danger[i][0]].startIndex, offsetBy: danger[i][1])
                let secondIndex = place[danger[i][0]].index(place[danger[i][0]].startIndex, offsetBy: danger[i+1][1])
                let a = place[danger[i][0]][firstIndex]
                let b = place[danger[i+1][0]][secondIndex]
                if a == "O" || b == "O" {
                    answer.append(0)
                    break
                }
            }
        }
        
        if count == answer.count {
            answer.append(1)
        }
        count += 1
    }
    print(answer)
    return answer
}

func findPosition(place: [String]) -> [[Int]] {
    var result: [[Int]] = []
    for i in 0..<place.count {
        for j in 0..<5 {
            let index = place[i].index(place[i].startIndex, offsetBy: j)
            if place[i][index] == "P" {
                let position = [i,j]
                result.append(position)
            }
        }
    }
    
    return result
}

func calculateDistance(position: [[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    for i in 0..<position.count {
        for j in i+1..<position.count {
            let manhattan = abs(position[i][0] - position[j][0]) + abs(position[i][1] - position[j][1])
            if manhattan <= 1 {
                result = []
                return result
            } else if manhattan <= 2 {
                result.append(position[i])
                result.append(position[j])
            }
        }
    }
    
    return result
}
