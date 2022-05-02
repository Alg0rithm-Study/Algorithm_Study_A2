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
    
    for position in moves {                                                             // 주어진 좌표를 받아서
        var count = 0                                                                   // 해당 count는 배열의 깊이가 될 예정 (1차원배열의 위치?)
        for toy in toys {                                                               // 2차원 배열을 하나씩 돌건데
            if toy[position-1] != 0 {                                                   // 받은 좌표에 해당 인형의 값이 0이 아니면 = 인형이 있으면
                if result.last == toy[position-1] {                                     // 근데 그 인형이 내가 가진 결과 배열의 마지막 인형이랑 같으면
                    result.removeLast()                                                 // 인형도 안넣고, 그 값을 remove
                    answer += 2                                                         // 그리고 터진 인형 만큼 +2
                } else {
                    result.append(toy[position-1])                                      // 앞 인형과 다르면 append
                }
                toys[count][position-1] = 0                                             // 인형을 처리했으니 그 자리는 0으로 바꿈
                break
            }
            count += 1                                                                  // 해당 toy 배열의 탐색이 끝나면 높이 + 1
        }
    }

    return answer
}

