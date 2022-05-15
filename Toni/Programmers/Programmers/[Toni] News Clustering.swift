//
//  [Toni] News Clustering.swift
//  Programmers 뉴스 클러스터링
//
//  Created by Sunwoo on 2022/05/14.
//

import Foundation

func solution12(_ str1:String, _ str2:String) -> Int {
    var arr1 = cutTwo(str: str1)
    var arr2 = cutTwo(str: str2)
    let total = arr1 + arr2
    var intersection: [String] = []
    
    if arr1.count == 0 && arr2.count == 0 {
        return 65536
    }
    
    for i in 0..<arr1.count {
        for j in 0..<arr2.count {
            if arr1[i] == arr2[j] {
                if arr2[j] == "" {
                    
                } else {
                    intersection.append(arr1[i])
                    arr1[i] = ""
                    arr2[j] = ""
                }
            }
        }
    }
    
    let union = total.count - intersection.count
    let answer = Double(intersection.count)/Double(union) * 65536
   
    return Int(answer)
}

func cutTwo(str: String) -> [String] {
    var result: [String] = []
    
    for i in 0..<str.count-1 {
        let index = str.index(str.startIndex, offsetBy: i)
        let next = str.index(str.startIndex, offsetBy: i+1)
        var first = str[index]
        var second = str[next]
        
        if first.isLetter && second.isLetter {
            first = Character(first.lowercased())
            second = Character(second.lowercased())
        
            let two = String(first) + String(second)
            result.append(two)
        }
    }
    
    return result
}
