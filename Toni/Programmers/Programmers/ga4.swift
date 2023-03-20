//
//  ga4.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/16.
//65

import Foundation

func solution65(_ board:[[Int]], _ c:Int) -> Int {
    var answer = 0
    let m = board.count
    let n = board[0].count
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var visit = Array(repeating: Array(repeating: false, count: n), count: m)
    
    func dfs(_ i: Int, _ j: Int) {
        if i < 0 || j < 0 || i >= m || j >= n {
            return
        }
        
        if visit[i][j] == true || board[i][j] == 0 {
            return
        }
        
        visit[i][j] = true
        
        answer += 1
        for index in 0...3 {
            let nx = i + dx[index]
            let ny = j + dy[index]
            dfs(nx, ny)
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == 2 {
                dfs(i, j)
            }
            
            
        }
    }
    
    print(answer)
    return answer
}
