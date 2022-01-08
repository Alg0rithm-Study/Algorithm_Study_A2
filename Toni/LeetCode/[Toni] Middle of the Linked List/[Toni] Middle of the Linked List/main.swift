//
//  main.swift
//  [Toni] Middle of the Linked List
//
//  Created by Sunwoo on 2022/01/08.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var node = head
        var answerNode = head
        var end: Int = 0
        
        while node != nil {
            node = node?.next
            end = node!.val
        }
        
        for _ in 0..<end {
            answerNode = answerNode?.next
        }
        
        return answerNode
    }
}
