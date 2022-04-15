//
//  [Toni] Merge Two Sorted Lists.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/01/15.
//
/*
 list1과 list2가 비어있을 경우를 대비해 제약조건을 걸어주고, 두 링크드리스트를 연결한 후 순회하여 값을 얻은 후 배열을 통해 sort. 그 후 처음부터 다시 순회하며 값을 입력시켜주고 return
 */

import Foundation

class Solution10 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil && list2 == nil {
            return list1
        } else if list1 == nil {
            return list2
        } else if list2 == nil {
            return list1
        }
        
        var node = list1
        var link = node
        var head = node
        let result = node
        var arr: [Int] = []
        
        while node!.next != nil {
            node = node?.next
        }
        
        node?.next = list2
        
        while link != nil {
            arr.append(link!.val)
            link = link?.next
        }
        
        arr.sort()
        
        while head != nil {
            head?.val = arr.removeFirst()
            head = head?.next
        }
        
        return result
    }
}

