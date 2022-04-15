//
//  [Toni] Get Report Result.swift
//  Programmers
//  신고 결과 받기
//
//  Created by Sunwoo on 2022/04/14.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let reports = Array(Set(report))                                // 중복을 제거
    var reportList: [String: [String]] = [:]                        // 신고당한 사람 : 신고한사람
    var result = Array(repeating: 0, count: id_list.count)          // 결과를 담을 배열
    var ids: [String: Int] = [:]                                    // 딕셔너리에 인덱스를 가져가기 위함
    
    for (index, id) in id_list.enumerated() {                       // 리스트로 받아온 인덱스를 기억해줌
        ids[id] = index
        reportList[id] = []                                         // 신고 명단도 만들기 위함
    }
    
//    print("ids: \(ids)")
//    print("reportList: \(reportList)")
    
    for report in reports {
        let reported = report.components(separatedBy: " ")          // 신고서를 "" 기준으로 분리
        
        reportList[reported[1]]!.append(reported[0])                // 신고한사람 신고당한 사람 순이므로 딕셔너리에는 0과 1을 바꿔서 append
    }
    
//    print("reportList2: \(reportList)")
    
    for ban in ids {                                                // 인덱스를 가진 딕셔너리에서
        if reportList[ban.key]!.count >= k {                        // 신고당한 횟수가 k보다 크면
            reportList[ban.key]!.forEach { name in
                result[ids[name]!] += 1                             // 이름을 가진 인덱스를 찾아서 그 위치 인덱스를 이용하여 result에 count를 1증가
            }
        }
    }
    
//    print(result)
    
    return result
}


//    for content in report {
//        let reported = content.components(separatedBy: " ")
//        let condition: ((String, [String])) -> Bool = {
//            $0.0.contains(reported[0])
//        }
//
//        if reportList.contains(where: condition) {
//            reportList[reported[0]]!.append(contentsOf: [reported[1]])
//        } else {
//            reportList.updateValue([reported[1]], forKey: reported[0])
//        }
//
//        //    var dict: [Int: [Int]] = [:]
//        //
//        //    for key, value in someArray {
//        //        dict[key, default: []].append(value)
//        //    }
//    }
