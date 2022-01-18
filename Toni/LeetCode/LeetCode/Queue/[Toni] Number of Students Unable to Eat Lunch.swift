//
//  [Toni] Number of Students Unable to Eat Lunch.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/19.
//
/*
 학생큐를 샌드위치에 맞는 사람이 나올때까지 반복해서, enqueue, dequeue
 학생큐를 다 순회했는데도, 샌드위치가 return되지 않으면 학생큐 카운트를 리턴
 */
import Foundation

class Solution17 {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var studentsQueue = students
        var sandwichesQueue = sandwiches
        
        for sand in sandwichesQueue {
            let sandCount = sandwichesQueue.count
            for _ in studentsQueue {
                let student = studentsQueue.removeFirst()
                if sand == student {
                    sandwichesQueue.removeFirst()
                    break
                } else {
                    studentsQueue.append(student)
                }
            }
            if sandCount == sandwichesQueue.count {
                return studentsQueue.count
            }
        }
        return studentsQueue.count
    }
}
