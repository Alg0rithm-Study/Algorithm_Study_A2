//
//  [Toni] Friends4Block.swift
//  Programmers 프렌즈4블록
//
//  Created by Sunwoo on 2022/06/11.

import Foundation

func solution16(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var line = [Character]()
    var game = [[Character]]()
    var indexArr = [[Int]]()
    var tempArr = [Int]()
    var answer = 0
    var flag = true
    
    for str in board {
        for i in str {
            line.append(i)
        }
        game.append(line)
        line.removeAll()
    }
    
    while flag {
        flag = false
        
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let firstCharacter = game[i][j]
                let secondCharacter = game[i][j+1]

                if firstCharacter == "0" {
                    continue
                }
                
                if firstCharacter == secondCharacter {
                    let thirdCharacter = game[i+1][j]
                    let fourthCharacter = game[i+1][j+1]
                    
                    if thirdCharacter == fourthCharacter {
                        if firstCharacter == thirdCharacter {
                            flag = true
                            tempArr.append(i)
                            tempArr.append(j)
                            indexArr.append(tempArr)
                            tempArr.removeAll()
                            
                            tempArr.append(i)
                            tempArr.append(j+1)
                            indexArr.append(tempArr)
                            tempArr.removeAll()
                            
                            tempArr.append(i+1)
                            tempArr.append(j)
                            indexArr.append(tempArr)
                            tempArr.removeAll()
                            
                            tempArr.append(i+1)
                            tempArr.append(j+1)
                            indexArr.append(tempArr)
                            tempArr.removeAll()
                        }
                    }
                }
            }
        }
        
        indexArr = Array(Set(indexArr))
        
        for index in indexArr {
            let i = index[0]
            let j = index[1]
            
            game[i][j] = "0"
            answer += 1
        }
        
        indexArr.removeAll()
        
        var zeroFlag = true
        while zeroFlag {
            zeroFlag = false
            for i in 0..<m-1 {
                for j in 0..<n {
                    let first = game[i][j]
                    let second = game[i+1][j]
                    
                    if first != "0" && second == "0" {
                        zeroFlag = true
                        game[i+1][j] = game[i][j]
                        game[i][j] = "0"
                    }
                }
            }
        }
    }
    
    return answer
}


//    var game = board
//    print(game)
//
//    var indexArr: [(Int,String.Index)] = []
//
//    for i in 0..<m-1 {
//        for j in 0..<n-1 {
//            print("-----------------")
//            let string = game[i]
//            let firstIndex = string.index(string.startIndex, offsetBy: j)
//            var firstChar = string[firstIndex]
//            print("first: \(firstChar)")
//
//            let scIndex = string.index(string.startIndex, offsetBy: j+1)
//            var secondChar = string[scIndex]
//            print("second: \(secondChar)" )
//
//            if firstChar == secondChar {
//                var scString = game[i+1]
//                let thirdIndex = scString.index(scString.startIndex, offsetBy: j)
//                var thirdChar = scString[thirdIndex]
//                print("third: \(thirdChar)")
//
//                let fourthIndex = scString.index(scString.startIndex, offsetBy: j+1)
//                var fourthChar = scString[fourthIndex]
//                print("fourth: \(fourthChar)")
//
//                if thirdChar == fourthChar {
//                    if firstChar == thirdChar {
//                        indexArr.append((i,firstIndex))
//                        indexArr.append((i,scIndex))
//                        indexArr.append((i,thirdIndex))
//                        indexArr.append((i,fourthIndex))
//                    }
//
//                }
//            }
//        }
//    }
//    print(game)
//    print(indexArr)
