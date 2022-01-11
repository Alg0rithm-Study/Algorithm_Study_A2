//
//  main.swift
//  [Toni] Reverse Linked List
//
//  Created by Sunwoo on 2022/01/11.
//
/*
 링크드리스트를 처음부터 순회하여 값을 배열에 저장한후 그배열의 마지막 값부터 다시 링크드리스트를 처음부터 순회할 때 차례차례 저장
 */
import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var reverseArr:[Int] = []
        var answerNode = head
        
        while node != nil {
            reverseArr.append(node!.val)
            node = node?.next
        }
        
        while answerNode != nil {
            answerNode?.val = reverseArr.removeLast()
            answerNode = answerNode!.next
        }
        
        return head
    }
}
