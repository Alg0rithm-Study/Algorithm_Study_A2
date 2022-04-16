//
//  [Toni] Recommend New Id.swift
//  Programmers 신규 아이디 추천
//
//  Created by Sunwoo on 2022/04/16.
//

import Foundation

func solution(_ new_id:String) -> String {
    var id = new_id
    id = step1(id)
    id = step2(id)
    id = step3(id)
    id = step4(id)
    id = step5(id)
    id = step6(id)
    id = step4(id)
    id = step7(id)
    
    print(id)
    return id
}

func step1(_ id: String) -> String {
    return id.lowercased()
}

func step2(_ id: String) -> String {
    let rule = ["-", "_", "."]
    let newId = id.filter { c in
        c.isLetter || c.isNumber || rule.contains(String(c))
    }

    return newId
}

func step3(_ id: String) -> String {
    var newID = id
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }

    return newID
}

func step4(_ id: String) -> String {
    var newId = id
    newId = newId.trimmingCharacters(in: ["."])
    
    return newId
}

func step5(_ id: String) -> String {
    if id == "" {
        return "a"
    } else {
        return id
    }
}

func step6(_ id: String) -> String {
    var newId = id
    while newId.count >= 16 {
        newId.removeLast()
    }
    
    return newId
}

func step7(_ id: String) -> String {
    var newId = id
    while newId.count < 3 {
        newId.append(newId.last!)
    }
    
    return newId
}
