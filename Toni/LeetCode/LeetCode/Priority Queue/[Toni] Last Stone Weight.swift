//
//  [Toni] Last Stone Weight.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/04/06.
//

import Foundation

class Solution28 {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stoneArr = stones
        
        while stoneArr.count > 1 {                      // 돌의 갯수가 2개이상일 경우만 반복문을 돈다.
            stoneArr.sort(by: >)                        // sort하여 내림차순 >의 방향으로 내림차순, 오름차순 선택가능
            let heaviestIndex = 0                       // 최대값의 인덱스
            let heaviest = stoneArr[heaviestIndex]      // 최대값
            
            let secondIndex = 1                         // 두번째 큰 값의 인덱스
            let second = stoneArr[secondIndex]          // 두번째 큰값
            
            let result = heaviest - second              // 부딪힌 돌의 파편
            stoneArr[heaviestIndex] = result            // 최대값에 넣어줌
            stoneArr.remove(at: secondIndex)            // 부서진 돌 제거
        }
        
        if stoneArr.count == 0 {                        // 남은 돌이 없는경우
            return 0                                    // 0
        } else {
            return stoneArr.first!                      // 있으면 리턴
        }
    }
}

/*
 func lastStoneWeight(_ stones: [Int]) -> Int {
         var stoneArr = stones
         
         while stoneArr.count > 1 {
             let heaviest = stoneArr.max()!
             let heaviestIndex = stoneArr.firstIndex(of: heaviest)!
             stoneArr.remove(at: heaviestIndex)
             
             let second = stoneArr.max()!
             let secondIndex = stoneArr.firstIndex(of: second)!
             let result = heaviest - second
             
             stoneArr.insert(result, at: heaviestIndex)
             stoneArr.remove(at: secondIndex)
         }
         
         if stoneArr.count == 0 {
             return 0
         } else {
             return stoneArr.first!
         }
     }
 */
