//
//  [Toni] Kakao 1.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/24.
//

import Foundation

func solution36(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termDic: [String: Int] = [:]
    var priArr: [[String]] = []
    let todayStr = today.components(separatedBy: ".")
    var answer: [Int] = []
    
    let year = Int(todayStr[0])! * 336
    let month = Int(todayStr[1])! * 28
    let day = Int(todayStr[2])!
    let todayTotal = year + month + day
    
    for term in terms {
        let arr = term.components(separatedBy: " ")
        let new = Int(arr[1])! * 28
        termDic.updateValue(new, forKey: arr[0])
    }
    
    //termDic 일수로 계산되어있음
    
    for privacy in privacies {
        var arr = privacy.components(separatedBy: " ")
        let dateArr = arr[0].components(separatedBy: ".")
        
        let year = Int(dateArr[0])! * 336
        let month = Int(dateArr[1])! * 28
        let day = Int(dateArr[2])!
        
        let total = String(year + month + day)
        arr[0] = total
     
        priArr.append(arr)
    }
    
    for i in 0..<priArr.count {
        let until = Int(priArr[i][0])! + termDic[priArr[i][1]]!
        if todayTotal - until >= 0 {
            answer.append(i+1)
        }
    }
    
    return answer
}
