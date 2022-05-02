//
//  [Toni] Claw Crane Game.swift
//  Programmers 크레인 인형뽑기 게임
//
//  Created by Sunwoo on 2022/05/02.
//

import Foundation

func solution9(_ board:[[Int]], _ moves:[Int]) -> Int {
    var toys = board
    var result: [Int] = []
    var answer = 0
    
    for position in moves {
        var count = 0
        for toy in toys {
            if toy[position-1] != 0 {
                if result.last == toy[position-1]{
                    result.removeLast()
                    answer += 2
                } else {
                    result.append(toy[position-1])
                }
                toys[count][position-1] = 0
                break
            }
            count += 1
        }
    }

    return answer
}

