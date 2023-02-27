//
//  [Toni] Network.swift
//  Programmers
//
//  Created by Sunwoo on 2023/02/27.
//

import Foundation

func solution54(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    var maxi = 0
    var maxj = 0
    
    while true {
        if maxi >= n {
            break
        }
        dfs(i: maxi, j: maxj)
        answer += 1
    }
    
    
    func dfs(i: Int, j: Int) {
        if i == computers.count || j == computers.count {
            maxi = max(i, maxi)
            maxj = max(j, maxj)
            return
        }
        
        if computers[i][j] == 0 {
            maxi = max(i, maxi)
            maxj = max(j, maxj)
            return
        }
        
        print("\(i) , \(j)")
        
        
        dfs(i: i+1, j: j)
        dfs(i: i, j: j+1)
    }
    
    
    print(answer)
    
    
    return 0
}
