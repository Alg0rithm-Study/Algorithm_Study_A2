//
//  main.swift
//  [Toni] Delete Node in a Linked List
//
//  Created by Sunwoo on 2022/01/11.
//
/*
 node의 값에 다음 노드의 값을 입력해준 후
 현재노드의 next를 다음 노드의 next 노드를 가리키게 하면됨. 이러면 point된 노드의 다음노드가 없어지는 원리
 */

import Foundation

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}


class Solution7 {
    func deleteNode(_ node: ListNode?) {
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
}
