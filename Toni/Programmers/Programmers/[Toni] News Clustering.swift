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
    let total = arr1 + arr2                                                         // 총 원소 갯수는 두개배열의 합
    var intersection: [String] = []
    
    if arr1.count == 0 && arr2.count == 0 {                                         // 둘다 공집합일 경우
        return 65536
    }
    
    for i in 0..<arr1.count {
        for j in 0..<arr2.count {
            if arr1[i] == arr2[j] {                                                 // 원소가 같은경우
                if arr2[j] == "" {                                                  // ""면 아무짓도 안함
                    
                } else {                                                            // ""가 아니면서 같은경우는
                    intersection.append(arr1[i])                                    // 교집합에 input
                    arr1[i] = ""                                                    // 그리고 ""로 바꿔줌
                    arr2[j] = ""
                }
            }
        }
    }
    
    let union = total.count - intersection.count                                    // 합집합은 전체와 교집합의 차집합
    let answer = Double(intersection.count)/Double(union) * 65536            
   
    return Int(answer)
}

func cutTwo(str: String) -> [String] {
    var result: [String] = []
    
    for i in 0..<str.count-1 {                                                          // 마지막 글자 전까지 반복
        let index = str.index(str.startIndex, offsetBy: i)                              // index i
        let next = str.index(str.startIndex, offsetBy: i+1)                             // index i + 1
        var first = str[index]                                                          // i번째 문자
        var second = str[next]                                                          // i+1 번째 문자
        
        if first.isLetter && second.isLetter {                                          // i번째와 그다음 문자가 글자일 경우에만 통과
            first = Character(first.lowercased())                                       // 대소문자 구분을 없애기 위해 모두 소문자로 치환
            second = Character(second.lowercased())
        
            let two = String(first) + String(second)                                    // 두개의 글자를 합쳐서
            result.append(two)                                                          // 결과 배열에 input
        }
    }
    
    return result
}
