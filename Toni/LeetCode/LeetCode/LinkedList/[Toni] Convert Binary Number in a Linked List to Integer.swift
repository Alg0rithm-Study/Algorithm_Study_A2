//
//  main.swift
//  [Toni] Convert Binary Number in a Linked List to Integer
//
//  Created by Sunwoo on 2022/01/08.
//
/*
 각 노드를 타고 이진수를 받아 10진수로 출력하는 문제
 
 node를 만들어주고 노드의 값이 nil일 때까지 node의 val값을 string타입으로 한줄씩 받은다음, Int(String, radix: 원하는 진수)를 이용하여 십진수로 변경
 */



import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution6 {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var bin = ""
        var node = head
        
        while node != nil {
            bin += String(node!.val)
            node = node?.next
        }
        
        let answer = Int(bin, radix: 2)!
        
        return answer
    }
}

