//
//  [Toni] Recommend New Id.swift
//  Programmers 신규 아이디 추천
//
//  Created by Sunwoo on 2022/04/16.
//

import Foundation

func solution2(_ new_id:String) -> String {
    var id = new_id
    id = step1(id)
    id = step2(id)
    id = step3(id)
    id = step4(id)
    id = step5(id)
    id = step6(id)
    id = step4(id)                                                              // 앞 뒤 . 제거하는 함수 다시한번 호출
    id = step7(id)
    
    return id
}

func step1(_ id: String) -> String {
    return id.lowercased()                                                      // 소문자로 치환
}

func step2(_ id: String) -> String {
    let rule = ["-", "_", "."]                                                  // 사용가능한 문자
    let newId = id.filter { c in
        c.isLetter || c.isNumber || rule.contains(String(c))                    // 다음의 조건만을 만족하는 아이디를 사용가능
    }

    return newId
}

func step3(_ id: String) -> String {
    var newID = id
    while newID.contains("..") {                                                // .. 이 없을때까지 반복문을 돈다
        newID = newID.replacingOccurrences(of: "..", with: ".")                 // .. 을 . 으로 교체
    }

    return newID
}

func step4(_ id: String) -> String {
    var newId = id
    newId = newId.trimmingCharacters(in: ["."])                                 // 양 끝에 있는 .을 제거
    
    return newId
}

func step5(_ id: String) -> String {
    if id == "" {                                                               // 빈 문자열이면
        return "a"                                                              // a
    } else {
        return id
    }
}

func step6(_ id: String) -> String {
    var newId = id
    while newId.count >= 16 {                                                   // 길이가 15보다 클경우
        newId.removeLast()                                                      // 마지막 글자를 제거
    }
    
    //(newId.prefix(15).description) = String()
    return newId
}

func step7(_ id: String) -> String {
    var newId = id
    while newId.count < 3 {                                                     // 길이가 3보다 작은경우
        newId.append(newId.last!)                                               // 마지막 글자를 append
    }
    
    return newId
}
