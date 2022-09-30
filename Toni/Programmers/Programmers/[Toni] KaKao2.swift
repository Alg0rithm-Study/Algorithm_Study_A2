//
//  [Toni] KaKao2.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/24.
//

import Foundation

func solution37(_ commands:[String]) -> [String] {
    var excel: [[String]] = Array(repeating: Array(repeating: "", count: 51), count: 51)
    var answer: [String] = []
    var comma: [[[Int]]] = []
    
    for command in commands {
        let arr = command.components(separatedBy: " ")
        
        if arr[0] == "UPDATE" {
            if arr.count == 4 { // r c 위치에 value 삽입
                if comma.count != 0 {
                    var test = [Int(arr[1])!,Int(arr[2])!]
                    var flag = true
                    while flag {
                        for com in comma {
                            if com.contains(test) {
                                for c in com {
                                    excel[c[0]][c[1]] = arr[3]
                                    
                                }
                            }
                        }
                    }
                } else {
                    excel[Int(arr[1])!][Int(arr[2])!] = arr[3]
                }
            } else { // value 1 -> value 2
                for i in 0..<excel.count {
                    for j in 0..<excel.count {
                        if excel[i][j] == arr[1] {
                            excel[i][j] = arr[2]
                        }
                    }
                }
            }
        } else if arr[0] == "MERGE" {
            if excel[Int(arr[1])!][Int(arr[2])!] == "" && excel[Int(arr[3])!][Int(arr[4])!] != "" {
                excel[Int(arr[1])!][Int(arr[2])!] = excel[Int(arr[3])!][Int(arr[4])!]
            } else {
                excel[Int(arr[1])!][Int(arr[2])!] = excel[Int(arr[1])!][Int(arr[2])!]
                excel[Int(arr[3])!][Int(arr[4])!] = excel[Int(arr[1])!][Int(arr[2])!]
            }
            let a = [Int(arr[1])!, Int(arr[2])!]
            let b = [Int(arr[3])!, Int(arr[4])!]
            let array = [a,b]
            comma.append(array)
        } else if arr[0] == "UNMERGE" {
            
        } else if arr[0] == "PRINT" {
            if excel[Int(arr[1])!][Int(arr[2])!] == "" {
                answer.append("EMPTY")
            } else {
                answer.append(excel[Int(arr[1])!][Int(arr[2])!])
            }
        }
    }
    
    
    return answer
}
