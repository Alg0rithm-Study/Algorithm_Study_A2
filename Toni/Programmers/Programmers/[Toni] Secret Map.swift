//
//  [Toni] Secret Map.swift
//  Programmers 비밀지도
//
//  Created by Sunwoo on 2022/05/02.
//

import Foundation

func solution10(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var result1: [String] = []
    var result2: [String] = []
    
    for i in arr1 {                                                                 // 이진수로 변환
        var binary = String(i, radix: 2)
        while binary.count < n {
            binary = "0" + binary                                                   // 자릿수가 모자란만큼 앞에 0을 부착
        }
        result1.append(binary)
    }
    
    for i in arr2 {
        var binary = String(i, radix: 2)
        while binary.count < n {
            binary = "0" + binary
        }
        result2.append(binary)
    }
  
    for i in 0..<result1.count {
        var str = ""                                                                // 결과가 될 문자
        for j in 0..<result1[i].count {                                             // 배열의 요소인 01001과 11110을 index 0번째 부터 차례차례 비교할 것
            let index = result1[i].index(result1[i].startIndex, offsetBy: j)        // string의 index구하기
            if result1[i][index] == result2[i][index] {                             // 해당 index의 값이 같다면
                if result1[i][index] == "1" {                                       // 같은데 1이면
                    str += "#"                                                      // # 아니면 공백
                } else {
                    str += " "
                }
            } else {                                                                // 값이 다르면 무조건 #
                str += "#"
            }
        }
        answer.append(str)
    }
 
    return answer
}

