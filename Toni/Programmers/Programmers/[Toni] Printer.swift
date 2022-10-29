//
//  [Toni] Printer.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/28.
//

import Foundation

func solution47(_ priorities:[Int], _ location:Int) -> Int {
    var works = priorities
    var count = 0
    var location = location
    
    while works.count > 0 {
        let worksCount = works.count
        let printer = works.removeFirst()
        location -= 1
        
        for i in 0..<works.count {
            if works[i] > printer {
                works.append(printer)
                
                if location == -1 {
                    location += works.count
                }
                
                break
            }
        }
        
        if worksCount == works.count {
            continue
        }
        
        count += 1
        if location == -1 {
            break
        }
    }

    return count
}
