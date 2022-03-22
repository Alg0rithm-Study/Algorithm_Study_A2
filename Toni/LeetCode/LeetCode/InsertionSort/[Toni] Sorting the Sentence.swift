//
//  [Toni] Sorting the Sentence.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/02/22.
//
/*
 각 문자열 뒤에 숫자를 기준으로 sorting. 공백을 기준으로 문자열을 가르고, 맨뒤 문자를 추출하여 sort
 */

import Foundation

class Solution23 {
    func sortSentence(_ s: String) -> String {
        var stringArr = s.components(separatedBy: " ")
        var numArr: [Int] = []
        var result = ""
        
//        for var str in stringArr {   원래 코드였으나 string에서 숫자가 빠지지않는 현상을 발견
//            numArr.append(Int(String(str.removeLast()))!)
//        }
        
        for idx in 0..<stringArr.count {
            numArr.append(Int(String(stringArr[idx].removeLast()))!)
        }
        
        insertionSort(&numArr, &stringArr)
 
        //stringArr.joined(separator: " ")
        
        for str in stringArr { // 공백을 주는 부분을 조금 더 깔끔하게 어떻게 할수 있을까?
            result += str + " "
        }
        
        result.removeLast()
        
        return result
    }
}

func insertionSort<Element: Comparable> (_ arr: inout [Element], _ stringArr: inout [String]) {
    if arr.count < 2 {
        return
    }
    
    for compare in 1..<arr.count {
        for current in (1...compare).reversed() {
            if arr[current] < arr[current-1] {
                arr.swapAt(current, current-1)
                stringArr.swapAt(current, current-1)
            } else {
                break
            }
        }
    }
}
