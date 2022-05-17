//
//  [Toni] Tuple.swift
//  Programmers 튜플
//
//  Created by Sunwoo on 2022/05/17.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var tuple = s
    tuple.removeFirst()                                                     // 우선 앞뒤의 {}를 제거
    tuple.removeLast()
  
    var result: [[Int]] = []                                                // 결과를 이중배열에 담을예정
    var mini: [Int] = []                                                    // 그안에 소규모로 나뉘어진것은 배열로 바꿀예정
    var str = ""                                                            // 123과 같은 숫자는 str으로 1+2+3 후 숫자로 캐스팅할예정
    var answer: [Int] = []
    
    tuple.forEach { c in
        if c == "," && !str.isEmpty {                                       // 들어온 것이 , 일 경우 문자열이 비어있으면 [],[] 콤마이므로 패스
            mini.append(Int(str)!)                                          // 소규모 그룹에 append
            str = ""                                                        // append 했으니까 초기화
        }
        
        if c == "}" {                                                       // 괄호가 닫힐경우는 소규모배열의 종료를 뜻함
            mini.append(Int(str)!)                                          // 우선 str에 남아있는 친구를 소규모 그룹에 append
            str = ""
            result.append(mini)                                             // 그 소규모 그룹을 결과 배열에 append
            mini = []
        }
        
        if c.isNumber {                                                     // 우선 들어온 것이 숫자면
            str += String(c)                                                // str에 쌓는다
        }
    }
    
    for count in 1...result.count {                                         // 단순히 배열 요소의 카운트를 계산하기 위한 포문
        for j in 0..<result.count {                                         // 요소를 하나씩 돌면서 검사할 거임
            if result[j].count == count {                                   // 요소의 갯수가 count랑 일치하면
                for num in result[j] {                                      // 그 요소 순회
                    if !answer.contains(num) {                              // 그 안에 겹치는게 없으면
                        answer.append(num)                                  // append~
                        break
                    }
                }
            }
        }
    }
    
    return answer
}
