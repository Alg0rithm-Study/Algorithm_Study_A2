//
//  [Toni] Number String and Voca.swift
//  Programmers 숫자 문자열과 영단어
//
//  Created by Sunwoo on 2022/04/17.
//

import Foundation

func solution3(_ s:String) -> Int {
    let answer =
        s.replacingOccurrences(of: "one", with: "1")
        .replacingOccurrences(of: "two", with: "2")
        .replacingOccurrences(of: "three", with: "3")
        .replacingOccurrences(of: "four", with: "4")
        .replacingOccurrences(of: "five", with: "5")
        .replacingOccurrences(of: "six", with: "6")
        .replacingOccurrences(of: "seven", with: "7")
        .replacingOccurrences(of: "eight", with: "8")
        .replacingOccurrences(of: "nine", with: "9")
        .replacingOccurrences(of: "zero", with: "0")
    
    
    
//    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
//    var str = s
//    for i in 0..<arr.count {
//        str = str.replacingOccurrences(of: arr[i], with: String(i))
//   }
    
    return Int(answer)!
}


 
 
 
