//
//  [Toni] Time Needed to Buy Tickets.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/22.
//

import Foundation
/*
 티켓 배열이 주어지고, k번째 라인의 티켓이 소진될때까지 걸리는 총 시간을 구하는 문제.
 */

class Solution18 {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var ticketLine = tickets                // 인자로 받으면 let이니까 복사
        var time = 0                            // 결과를 return 할 time
        
        while ticketLine[k] != 0 {              // k번째 라인의 티켓이 소진될때까지 while문을 돌게됨
            for i in 0..<ticketLine.count {     // k번째 라인이외에도 순회를 하면서 시간을 카운트하고 티켓수를 소진하기 때문에 for문 사용 (for ticket in ticketLine은 상수라서 사용불가)
                if ticketLine[i] > 0 {          // 해당 라인에서 티켓의 재고가 있을 경우만
                    ticketLine[i] -= 1          // 티켓을 차감하고
                    time += 1                   // 시간을 카운트
                    if ticketLine[k] == 0 {     // 처음에는 k번째 라인에서 티켓이 소진되어도 k+1라인에서는 구매가능할줄알았는데,
                        break                   // 알고보니 k번째 라인에서 티켓이 소진되는 즉시 사람은 대기열을 떠남
                    }
                }
            }
        }
        return time
    }
}
