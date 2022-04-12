//
//  [Toni] Find Center of Star Graph.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/04/12.
//
// 어쩌피 공통되는 것은 한개밖에 없으니.. 공통된 숫자를 찾게된다면 그 숫자가 중심노드일것이라고 생각


import Foundation

class Solution30 {
    func findCenter(_ edges: [[Int]]) -> Int {
        if edges[0][0] == edges[1][0] || edges[0][0] == edges[1][1] {
            return edges[0][0]
        } else {
            return edges[0][1]
        }
    }
}
