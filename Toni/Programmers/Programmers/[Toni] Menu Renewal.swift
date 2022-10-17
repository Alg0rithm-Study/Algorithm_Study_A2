//
//  [Toni] Menu Renewal.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/10.
//

import Foundation

func solution27(_ orders:[String], _ course:[Int]) -> [String] {
    var str = ""
    var menuSet: [String: Int] = [:]
    
    func combi(origin: [Character], n: Int, resultString: String) {
        if resultString.count > 1 && course.contains(resultString.count) {
            if menuSet.keys.contains(resultString) {
                menuSet[resultString]! += 1
            } else {
                menuSet[resultString] = 1
            }
        }
        
        for i in n+1..<origin.count {
            combi(origin: origin, n: i, resultString: "\(resultString)\(origin[i])")
        }
    }
    
    for order in orders {
        let menus: [Character] = order.map { $0 }.sorted()
        for i in menus.indices {
            combi(origin: menus, n: i, resultString: "\(menus[i])")
        }
    }
    
    return []
}
