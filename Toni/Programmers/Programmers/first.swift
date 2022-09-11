//
//  first.swift
//  Programmers
//
//  Created by Sunwoo on 2022/06/27.
//

import Foundation

let keyboard : [[Character]] = [["가", "호", "저", "론", "남", "드", "부", "이","프","설"]]


func solution22(_ word: String) -> [Int] {
    var sentence = [Character]()
    var xyArr : [[Int]] = []
    var distance = [Int]()
    
    for c in word {
        sentence.append(c)
    }
    
    var count = 0
    
    for c in sentence {
        var flag = false
        for i in 0..<keyboard.count {
            for j in 0..<keyboard[i].count {
                if c == keyboard[i][j] {
                    var tmp = [Int]()
                    tmp.append(i)
                    tmp.append(j)
                    if flag == false {
                        flag = true
                        if xyArr.isEmpty {
                            xyArr.append(tmp)
                        } else {
                            let a = xyArr.last!
                            xyArr.append(tmp)
                            let dis = calculateDistance(a: a, b: tmp)
                            distance.append(dis)
                            count += 1
                        }
                    } else {
                        let first = xyArr.removeLast()
                        let last = xyArr.last!
                        
                        let firstDis = distance.removeLast()
                        let lastDis = calculateDistance(a: last, b: tmp)
                        
                        if firstDis == lastDis {
                            let fDis = calculateDistance(a: [0,0], b: first)
                            let lDis = calculateDistance(a: [0,0], b: last)
                            
                            if fDis > lDis {
                                distance.append(lDis)
                                xyArr.append(tmp)
                            } else {
                                distance.append(fDis)
                                xyArr.append(first)
                            }
                        } else if firstDis > lastDis {
                            distance.append(lastDis)
                            xyArr.append(tmp)
                        } else {
                            distance.append(firstDis)
                            xyArr.append(first)
                        }
                    }
                }
                
            }
        }
    }
    
    print(count)
    
    print(distance)
    
    
    return []
}

func calculateDistance(a:[Int] , b: [Int]) -> Int {
    return (abs(a[0] - b[0]) + abs(a[1] - b[1]))
}
