//
//  [Toni] Implement Stack using Queues.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/25.
//
/*
 큐 2개를 이용하여 스택을 구현 // 두가지방법 pop 할때 큐의 요소를 옮겨주는 방식, push 할때 큐의 요소를 옮겨주는 방식
 push를 하게되면 우선 빈큐에 값을 받게됨. 그 후, 값을 받지않은 큐에서 새롭게 값을 받은 큐로 모든 요소를 pop. 그렇게되면 마지막에 들어오는 숫자는 항상 큐의 제일 앞에 위치하게 됨.
 */

import Foundation

class MyStack {
    var queue1: [Int] = [] // 첫번째 빈큐 생성
    var queue2: [Int] = [] // 두번째 빈큐 생성

    init() {
        
    }
    
    func push(_ x: Int) {                           // push 할때
        if checkFirstQueue() {                      // 첫번째 큐가 비어있으면
            queue1.append(x)                        // 첫번째 큐에 push
            
            while !queue2.isEmpty {                 // 비어있지않은 두번째 큐에서
                queue1.append(queue2.removeFirst()) // 첫번째 큐로 모두 값을 pop
            }
        } else {                                    // 반대로 두번째 큐가 비어있으면
            queue2.append(x)                        // 두번째 큐에 push
            
            while !queue1.isEmpty {                 // 같은 원리
                queue2.append(queue1.removeFirst())
            }
        }
    }
    
    func pop() -> Int {
        if checkFirstQueue() {                      // 첫번째 큐가 비어있으면
            return queue2.removeFirst()             // 두번째 큐에서 pop
        } else {
            return queue1.removeFirst()
        }
    }
    
    func top() -> Int {
        if checkFirstQueue() {
            return queue2.first!
        } else {
            return queue1.first!
        }
    }
    
    func empty() -> Bool {
        return queue1.isEmpty && queue2.isEmpty
    }
    
    func checkFirstQueue() -> Bool {
        if queue1.isEmpty {
            return true
        } else {
            return false
        }
    }
}

