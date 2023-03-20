//
//  ga1.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/16.
//62

import Foundation

func solution62(_ sticker:[Int]) -> Int{
    var answer = 0
    var answerArr: [Int] = []
    var answerIndex: [Int] = []
    var index = -1
    
    if sticker.count <= 2{
        return sticker.max()!
    }
    
    if sticker.count % 2 == 0 {
        for i in 0..<sticker.count {
            if answerIndex.contains(i) {
                continue
            }
            
            var arr: [Int] = []
            if i != sticker.count - 1 {
                arr.append(sticker[i])
                arr.append(sticker[i+1])
                answerArr.append(findMax(arr: arr))
                var temp = findXindex(arr: arr)
                index = temp + i
                answerIndex.append(index)
                answerIndex.append(index + 1)
            } else {
                answerArr.append(sticker[i])
            }
        }
    } else {
        for i in 0..<sticker.count {
            if answerIndex.contains(i) {
                continue
            }
            
            var arr: [Int] = []
            if i < sticker.count - 2 {
                arr.append(sticker[i])
                arr.append(sticker[i+1])
                arr.append(sticker[i+2])
                answerArr.append(findMax(arr: arr))
                var temp = findXindex(arr: arr)
                if temp == 2 {
                    answerArr.append(sticker[i])
                    answerIndex.append(i)
                    answerIndex.append(i + temp - 1)
                }
                index = temp + i
                answerIndex.append(index)
                answerIndex.append(index + 1)
            } else {
                answerArr.append(sticker[i])
            }
        }
    }
    
    //answerArr.reduce(+, 0)
    print(answerArr)
    return answer
}

func findMax(arr: [Int]) -> Int {
    var maxValue = 0
    
    for a in arr {
        maxValue = max(a, maxValue)
    }
    
    return maxValue
}

func findXindex(arr: [Int]) -> Int {
    var maxValue = arr[0]
    var index = 0
    
    for i in 0..<arr.count {
        if maxValue < arr[i] {
            maxValue = arr[i]
            index = i
        }
    }
    
    return index
}
