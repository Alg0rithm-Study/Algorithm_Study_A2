//
//  [Toni] The K Weakest Rows in a Matrix.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/03/23.
//

import Foundation

class Solution25 {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dict: [Int: Int] = [:] // 딕셔너리를 이용
        var index = 0 // 키에는 인덱스를 밸류에는 1의 갯수를 넣을 것
        
        for element in mat { // 각 요소마다
            let count = element.filter { $0 == 1 }.count // 1의 갯수를
           
            dict.updateValue(count, forKey: index) // value에 넣고, index를 key에 넣는다
            index += 1 // 다음 인덱스를 위해 1 증가
        }
        
        print(dict)
        
        let sorted = dict.sorted {
            $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value } // 밸류의 값을 따라 정렬
        print(sorted)// 키값은 큰 순서부터 정렬이 되는데.. 어떻게 하면 sort를 하면서 키값이 작은 순서대로 넣어줄 수 있을까요? 딕셔너리 적응안된다..
        
        var answer: [Int] = []
        for i in 0..<k { // 그리고 입력받은 k까지
            answer.append(sorted[i].key) // key값을 배열에 append
        }
        print(answer)
        return answer
    }
}
