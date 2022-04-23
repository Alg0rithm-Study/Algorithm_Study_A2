//
//  [Toni] training clothes.swift
//  Programmers 체육복
//
//  Created by Sunwoo on 2022/04/22.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostStudents = lost.sorted()                                                            // 정렬
    var reserveStudents = reserve.sorted()
    
    for lostStudent in lostStudents {                                                           // 우선 여벌이 있는데도 도둑맞은애들 검출
        if reserveStudents.contains(lostStudent) {                                              // 인덱스를 찾아서
            var index = foundIndex(lostStudent: lostStudent, arr: reserveStudents)              // 여유배열에서 remove
            reserveStudents.remove(at: index)
            
            index = foundIndex(lostStudent: lostStudent, arr: lostStudents)                     // 똑같이
            lostStudents.remove(at: index)                                                      // 잃어버린 배열에서도 제거
        }
    }
    
    for lostStudent in lostStudents {
        if reserveStudents.contains(lostStudent - 1) {                                          // 앞번호 부터 제거
            var index = foundIndex(lostStudent: lostStudent - 1, arr: reserveStudents)
            reserveStudents.remove(at: index)
            
            index = foundIndex(lostStudent: lostStudent, arr: lostStudents)
            lostStudents.remove(at: index)
        } else if reserveStudents.contains(lostStudent + 1) {                                   // 일치하는게 없으면 뒷번호
            var index = foundIndex(lostStudent: lostStudent + 1, arr: reserveStudents)
            reserveStudents.remove(at: index)
            
            index = foundIndex(lostStudent: lostStudent, arr: lostStudents)
            lostStudents.remove(at: index)
        }
    }
    
    let answer = n - lostStudents.count
    
    return answer
}

func foundIndex(lostStudent: Int, arr: [Int]) -> Int {                                          // 배열과, 학생번호를 받음
    var index = 0
    for idx in 0...arr.count {                                                                  // 해당배열을 돌면서
        if lostStudent == arr[idx] {                                                            // 학생번호와 일치하는 인덱스의 값을 찾음
            index = idx
            break
        }
    }
    
    return index
}
