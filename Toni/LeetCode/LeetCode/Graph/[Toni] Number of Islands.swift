//
//  [Toni] Number of Islands.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/06/04.
//

import Foundation

class Solution32 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var answer = 0
        let m = grid.count
        let n = grid[0].count
        
        let dx = [1,-1,0,0]
        let dy = [0,0,1,-1]
        
        var visit = Array(repeating: Array(repeating: false, count: n), count: m)
        
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || j < 0 || i >= m || j >= n {
                return
            }
            
            if visit[i][j] == true || grid[i][j] == "0" {
                return
            }
            
            visit[i][j] = true
            
            for index in 0...3 {
                let nx = i + dx[index]
                let ny = j + dy[index]
                dfs(nx, ny)
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                guard grid[i][j] == "1" && !visit[i][j] else {
                    continue
                }
                dfs(i, j)
                answer += 1
            }
        }
        
        return answer
    }
}
