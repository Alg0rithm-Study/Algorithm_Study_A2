//
//  [Toni] Caesar Cipher.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/27.
//

import Foundation

func solution46(_ s:String, _ n:Int) -> String {
    let zValue = Int(UnicodeScalar("z").value)
    let ZValue = Int(UnicodeScalar("Z").value)
    var answer = ""

    for ch in s {
        if ch == " " {
            answer += " "
            continue
        }
        
        let value = Int(UnicodeScalar(String(ch))!.value)
        
        if value <= ZValue {
            if value + n > ZValue {
                answer += String(UnicodeScalar(value + n - 26)!)
            } else {
                answer += String(UnicodeScalar(value + n)!)
            }
        } else {
            if value + n > zValue {
                answer += String(UnicodeScalar(value + n - 26)!)
            } else {
                answer += String(UnicodeScalar(value + n)!)
            }
        }
    }

    return answer
}
