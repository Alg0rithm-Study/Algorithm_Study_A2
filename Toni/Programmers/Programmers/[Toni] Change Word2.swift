//
//  [Toni] Change Word2.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/01.
//

import Foundation

func solution55(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var queue: [String] = []
       queue.append(begin)
       
       var visited = [Bool] (repeating: false, count: words.count)
       var count: Int = 0
       
       while !queue.isEmpty {
           let now = queue.popLast()!
           if now == target {
               break
           }
           count += 1
           
            for i in 0..<words.count {
                if !visited[i] {
                    if checkOnlyOne(word: words[i], now: now) {
                        queue.append(words[i])
                        visited[i] = true
                    }
                }
            }
        }
    print(count)
    return 0
}

func checkOnlyOne(word: String, now: String) -> Bool {
    if word.count != now.count {
           return false
       }
       
       var count: Int = 0
       
       let arrWord = Array(word)
       let arrNow = Array(now)
       
       for i in 0..<arrWord.count {
           if arrWord[i] != arrNow[i] {
               count += 1
           }
           
           if count > 1 {
               return false
           }
       }
       
       return true
}
