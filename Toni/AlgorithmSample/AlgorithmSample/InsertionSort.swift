//
//  InsertionSort.swift
//  AlgorithmSample
//
//  Created by Sunwoo on 2022/02/20.
//

import Foundation


func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else {
        return
    }
    
    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
    print(array)
}


