//
//  [Toni] Menu Renewal.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/10.
//

import Foundation

func solution27(_ orders:[String], _ course:[Int]) -> [String] {
    var set = [String: Int]()
    
    func dfs(index: Int, origin: [Character], newString: String) {
        if course.last! < newString.count {
            return
        }
        
        if course.contains(newString.count) {
            if set.keys.contains(newString) {
                set[newString]! += 1
            } else {
                set[newString] = 1
            }
        }
        
        for i in index..<origin.count {
            let c = origin[i]
            dfs(index: i+1, origin: origin, newString: "\(newString)\(c)")
        }
    }
    
    for order in orders {
        let order = order.sorted()
        dfs(index: 0, origin: order, newString: "")
        print("order = \(order), set = \(set)")
        print("----------------------")
    }
    
    
    
    
    return []
}
