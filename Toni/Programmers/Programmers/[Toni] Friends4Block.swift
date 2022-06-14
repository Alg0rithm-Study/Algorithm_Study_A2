//
//  [Toni] Friends4Block.swift
//  Programmers 프렌즈4블록
//
//  Created by Sunwoo on 2022/06/11.

import Foundation

func solution16(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var line = [Character]()
    var game = [[Character]]()
    var indexArr = [[Int]]()                    // 좌표를 보관할 용도
    var tempArr = [Int]()                       // 좌표 보관용도
    var answer = 0
    var flag = true                             // flag = true 될때까지 while문을 돌릴예정
    
    for str in board {                          // board에 있는 str을
        for i in str {
            line.append(i)                      // 2중 배열로 바꿔줌
        }
        game.append(line)
        line.removeAll()
    }
    
    while flag {                                                    // flag가 true면
        flag = false
        
        for i in 0..<m-1 {                                          // 각 원소갯수만큼 루프를 돌건데
            for j in 0..<n-1 {
                let firstCharacter = game[i][j]                     // 첫번째 캐릭터와
                let secondCharacter = game[i][j+1]                  // 그 옆 두번째 캐릭터

                if firstCharacter == "0" {                          // 첫번째꺼가 0이면 (지워지는 애들을 0으로 바꿔줄거임)
                    continue                                        // 밑에 검사 안함
                }
                
                if firstCharacter == secondCharacter {              // 두개가 같으면
                    let thirdCharacter = game[i+1][j]
                    let fourthCharacter = game[i+1][j+1]
                    
                    if thirdCharacter == fourthCharacter {          // 그 아래 두개를 검사
                        if firstCharacter == thirdCharacter {       // 두개는 서로 같으니, 위아래도 검사
                            flag = true                             // 트루로 바꾸고
                            tempArr.append(i)
                            tempArr.append(j)
                            indexArr.append(tempArr)                // 좌표를 넣는다.
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
        
        indexArr = Array(Set(indexArr))                             // 중복좌표를 제거하고
        
        for index in indexArr {
            let i = index[0]
            let j = index[1]
            
            game[i][j] = "0"                                        // 터진애들을 0 처리
            answer += 1                                             // 그리고 개수를 센다
        }
        
        indexArr.removeAll()                                        // 좌표부분을 비우고
        
        var zeroFlag = true                                         // 0으로 만든부분을 맨위로 올려줄거임
        while zeroFlag {
            zeroFlag = false
            for i in 0..<m-1 {
                for j in 0..<n {
                    let first = game[i][j]                          // 위에있는애와
                    let second = game[i+1][j]                       // 아래있는애를 비교할거임
                    
                    if first != "0" && second == "0" {              // 위에 인형이 있고 아래에는 공백이라면
                        zeroFlag = true
                        game[i+1][j] = game[i][j]                   // 인형은 가라앉는다
                        game[i][j] = "0"
                    }                                               // 이행위를 계속 반복
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
