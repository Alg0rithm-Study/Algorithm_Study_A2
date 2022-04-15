//
//  [Toni] Count Negative Numbers in a Sorted Matrix.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/03/23.
//

import Foundation

class Solution24 {
    func countNegatives(_ grid: [[Int]]) -> Int {
        let firstResult = grid.flatMap { $0 } // flatmap을 사용하여 배열을 벗긴후
        let result = firstResult.filter { $0 < 0 } // filter를 사용..
        //이렇게 푸는게 이진탐색을 이용한 건 아닌거같은데...
        return result.count
    }
}
