//Logic
//1. 초기 head.val을 변수에 저장
//2. while let으로 next가 nil일 때 까지 반복하여 3 수행
//3. 초기값에 2 곱하고 next.val 더하기
//4. while문 반복이 끝나면 연산 완료된 초기값 변수를 반환

//Solution
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard var initial = head?.val else { return 0 }
        while let node = head?.next {
            initial = initial * 2 + node.val
            head?.next = node.next
        }
        return initial
    }
}
