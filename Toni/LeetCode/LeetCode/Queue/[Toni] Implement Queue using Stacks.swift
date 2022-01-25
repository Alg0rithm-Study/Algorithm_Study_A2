//
//  [Toni] Implement Queue using Stacks.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/24.
//
/*
 스택 2개를 이용하여 큐를 구현하기.
 */
import Foundation


class MyQueue {
    var stack1: [Int] = [] // 첫번째 스택 push 전용
    var stack2: [Int] = [] // 두번째 스택 pop 전용
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack1.append(x) // 입력을 받을땐 stack1 에만
    }
    
    func pop() -> Int {
        if stack2.isEmpty { // stack2에서만 pop을 할건데 비어있으면
            moveToStack2()  // stack1에 있는 요소들을 모두 stack2로 옮김
        }
        let pop = stack2.removeLast() // stack2에 요소를 pop
        return pop
    }
    
    func peek() -> Int {
        if stack2.isEmpty {
            moveToStack2()
        }
        let peek = stack2.last!
        return peek
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
    
    func moveToStack2() {
        while !stack1.isEmpty {             // stack1을 모두 비울때까지
            let num = stack1.removeLast()   // stack1요소를 stack2로 옮김
            stack2.append(num)
        }
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
