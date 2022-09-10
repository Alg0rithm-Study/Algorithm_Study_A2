//
//  [Toni] Cache.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/10.
//

import Foundation

func solution29(_ cacheSize:Int, _ cities:[String]) -> Int {
    var lowerCities: [String] = []
    var cache = Array(repeating: "", count: cacheSize)
    var totalTime = 0
    
    for city in cities {
        lowerCities.append(city.lowercased())
    }
    
    for city in lowerCities {
        if cache.contains(city) {
            let index = cache.firstIndex(of: city)!
            cache.remove(at: index)
            cache.append(city)
            totalTime += 1
        } else {
            if cache.count != 0 {
                cache.removeFirst()
                cache.append(city)
            }
            totalTime += 5
        }
    }

    return totalTime
}
