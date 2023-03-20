//
//  [Toni] Background Clean.swift
//  Programmers
//
//  Created by Sunwoo on 2023/03/14.
//

import Foundation

func solution59(_ wallpaper:[String]) -> [Int] {
    var minx = Int.max
    var maxx = Int.min
    var miny = Int.max
    var maxy = Int.min
    
    var yIndex = 0
    for paper in wallpaper {
        var xIndex = 0
        for sp in paper {
            if sp == "#" {
                minx = min(minx, xIndex)
                maxx = max(maxx, xIndex)
                miny = min(miny, yIndex)
                maxy = max(maxy, yIndex)
            }
            xIndex += 1
        }
        yIndex += 1
    }
    
    let answer = [miny , minx, maxy + 1, maxx + 1]
    print(answer)
    
    return answer
}
