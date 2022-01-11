//
//  main.swift
//  [Toni] Build Array from Permutation
//
//  Created by Sunwoo on 2022/01/08.
//
/*
 map을 이용해서 배열을 바꿔줌.
 */

import Foundation

let nums = [0,2,1,5,3,4]

class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        let arr = nums.map { num in
            nums[num]
        }

        arr.map { num in
            arr[num]
        }
        
        return arr
    }
}
