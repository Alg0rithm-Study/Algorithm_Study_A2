//
//  [Toni] Final Prices With a Special Discount in a Shop.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/17.
//
/*
 자기 자신을 제외한 이후 값들 중 자신보다 작은 수가 있으면 discount하고 input, 없으면 그대로 input하는 문제.
 배열을 순회하면서 다음값들과 비교하여 결과를 반환. 자신이 다음값보다 크면 뺀 후 값에 담아서 break.
 그렇지않으면 그다음값을 찾아감. 못찾으면 자기자신을 반환. 문제는 상당히 c++스러움....
 
 */

import Foundation

class Solution13 {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var answer:[Int] = []
        
        for i in 0..<prices.count {
            var result = prices[i]
            
            for j in i+1..<prices.count {
                if prices[i] >= prices[j] {
                    result = prices[i] - prices[j]
                    break
                }
            }
            answer.append(result)
        }
        return answer
    }
}
