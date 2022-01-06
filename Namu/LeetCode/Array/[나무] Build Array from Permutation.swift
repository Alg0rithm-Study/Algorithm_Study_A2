//Logic
//1. map 사용
//2. num 순회하며 num[i]를 원소로 가지는 새로운 배열 생성
//3. 반환

//Solution
import Foundation

class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        nums.map { nums[$0] }
    }
}
