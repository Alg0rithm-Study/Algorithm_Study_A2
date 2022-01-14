//
//  main.swift
//  [Toni] Middle of the Linked List
//
//  Created by Sunwoo on 2022/01/08.
//
/*
 미완성
 */
import Foundation

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}

class Solution9 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var node = head
        var nodeCount = 0
        var answerNode = head
        
        while node != nil {
            node = node?.next
            nodeCount += 1
        }
        
        for _ in 0..<nodeCount/2 {
            answerNode = answerNode?.next
        }
        
        return answerNode
    }
}
