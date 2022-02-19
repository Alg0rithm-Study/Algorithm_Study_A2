//
//  SelectionSort.swift
//  AlgorithmSample
//
//  Created by Sunwoo on 2022/02/20.
//

import Foundation

func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else {
      return
    }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}
