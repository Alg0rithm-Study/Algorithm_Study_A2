//
//  [Toni] training clothes.swift
//  Programmers
//
//  Created by Sunwoo on 2022/04/22.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostStudents = lost.sorted()
    var reserveStudents = reserve.sorted()
    
    for lostStudent in lostStudents {
        if reserveStudents.contains(lostStudent) {
            var index = foundIndex(lostStudent: lostStudent, arr: reserveStudents)
            reserveStudents.remove(at: index)
            
            index = foundIndex(lostStudent: lostStudent, arr: lostStudents)
            lostStudents.remove(at: index)
        }
    }
    
    for lostStudent in lostStudents {
        if reserveStudents.contains(lostStudent - 1) {
            var index = foundIndex(lostStudent: lostStudent - 1, arr: reserveStudents)
            reserveStudents.remove(at: index)
            
            index = foundIndex(lostStudent: lostStudent, arr: lostStudents)
            lostStudents.remove(at: index)
        } else if reserveStudents.contains(lostStudent + 1) {
            var index = foundIndex(lostStudent: lostStudent + 1, arr: reserveStudents)
            reserveStudents.remove(at: index)
            
            index = foundIndex(lostStudent: lostStudent, arr: lostStudents)
            lostStudents.remove(at: index)
        }
    }
    
    let answer = n - lostStudents.count
    
    return answer
}

func foundIndex(lostStudent: Int, arr: [Int]) -> Int {
    var index = 0
    for idx in 0...arr.count {
        if lostStudent == arr[idx] {
            index = idx
            break
        }
    }
    
    return index
}
