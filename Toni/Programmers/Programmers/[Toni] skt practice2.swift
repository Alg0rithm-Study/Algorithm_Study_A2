//
//  [Toni] skt practice2.swift
//  Programmers
//
//  Created by Sunwoo on 2022/10/08.
//

import Foundation

func solution42(_ arr:[Int]) -> Bool {
    var answer = true
    let set = Set(arr)
    
    if set.count != arr.count {
        return false
    }
    
    for i in 0..<arr.count {
        if arr[i] > arr.count {
            return false
        }
    }

    return true
}
