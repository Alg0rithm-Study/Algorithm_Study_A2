//
//  [Toni] Open Chat.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/09.
//

import Foundation

func solution26(_ record:[String]) -> [String] {
    var records: [[String]] = []
    var recordDic: [String: String] = [:]
    var answer: [String] = []
    
    for rec in record {
        let arr = rec.components(separatedBy: " ")
        records.append(arr)
        if arr[0] == "Enter" || arr[0] == "Change" {
            recordDic.updateValue(arr[2], forKey: arr[1])
        }
    }
    
    for record in records {
        if record[0] == "Enter" {
            let result = recordDic[record[1]]! + "님이 들어왔습니다."
            answer.append(result)
        } else if record[0] == "Leave" {
            let result = recordDic[record[1]]! + "님이 나갔습니다."
            answer.append(result)
        }
    }
    
    return answer
}
