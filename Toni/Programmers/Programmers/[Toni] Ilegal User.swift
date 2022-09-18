//
//  [Toni] Ilegal User.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/11.
//

import Foundation

func solution32(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result: [[String]] = []
    var set = Set<[String]>()
    
    
    for banid in banned_id {
        var arr: [String] = []
        for user in user_id {
            if checkId(userId: user, banId: banid) {
                arr.append(user)
            }
        }
        result.append(arr)
    }
    
    print(result)
    
    func combi(i: Int, select: [String]) {
        if select.count == banned_id.count {
            set.update(with: select.sorted())
            return
        }
        
        var select = select
        let arr = result[i]
        for n in arr {
            if select.contains(n) {
                continue
            }
            select.append(n)
            combi(i: i+1, select: select)
            select.removeLast()
        }
    }
    
    combi(i: 0, select: [])
    print(set)
    
    
    return set.count
}





func checkId(userId: String, banId: String) -> Bool {
    var ban_id = banId
    var user_id = userId
    
    if userId.count != banId.count {
        return false
    }
    
    while !ban_id.isEmpty {
        let banC = ban_id.removeFirst()
        let userC = user_id.removeFirst()
        
        if banC == "*" {
            continue
        }
        
        if banC != userC {
            return false
        }
    }
    
    return true
}
