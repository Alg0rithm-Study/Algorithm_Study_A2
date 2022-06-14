//
//  [Toni] Archery.swift
//  Programmers 양궁대회
//
//  Created by Sunwoo on 2022/06/03.
//

import Foundation

func solution15(_ n:Int, _ info:[Int]) -> [Int] {
    let m = info.count
    let dx = [-1,1]
    var visit = Array(repeating: false, count: m)
    
    func dfs(_ i: Int) {
        if i<0 || i>=m {
            return
        }
        
        if visit[i] == true {
            return
        }
        
        
    }
    
    return []
}
