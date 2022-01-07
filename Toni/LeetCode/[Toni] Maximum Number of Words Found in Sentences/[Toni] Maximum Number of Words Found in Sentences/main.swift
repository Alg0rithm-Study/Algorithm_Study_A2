//
//  main.swift
//  [Toni] Maximum Number of Words Found in Sentences
//
/*
 문자열을 공백을 기준으로 슬라이싱 한후 count를 하여 최대값을 구하는 문제
 
 각 문장을 split하여 count를 하여 값을 구한 후 이전값과 비교하여 값을 구함
 */

class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        var answer = 0
        for sentence in sentences {
             let result = sentence.split(separator: " ").count
    
            if answer < result {
                answer = result
            }
        }
        return answer
    }
}
