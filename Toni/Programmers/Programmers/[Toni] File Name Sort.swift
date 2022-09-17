//
//  [Toni] File Name Sort.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/17.
//

import Foundation

func solution33(_ files:[String]) -> [String] {
    var filesArr: [[String]] = []
    
    for file in files {
        var str = ""
        var strArr: [String] = []
        for c in file {
            if strArr.count == 2 {
                str += String(c)
                continue
            }
            
            if c.isLetter || c.isPunctuation || c.isMathSymbol || c.isWhitespace {
                if strArr.count == 1 {
                    strArr.append(str)
                    str = ""
                }
                
                str += String(c)
            } else if c.isNumber {
                if !str.isEmpty && str.first!.isLetter {
                    strArr.append(str)
                    str = ""
                }
                str += String(c)
            }
        }
        strArr.append(str)
        filesArr.append(strArr)
    }
    
    let results = filesArr.sorted { fir, sec in
        if fir[0].lowercased() != sec[0].lowercased() {
            return fir[0].lowercased() < sec[0].lowercased()
        } else if Int(fir[1])! != Int(sec[1])! {
            return Int(fir[1])! < Int(sec[1])!
        }
        
        return false
    }
    
    var answer: [String] = []
    
    for result in results {
        var str = ""
        for res in result {
            str += res
        }
        answer.append(str)
    }
    
    return answer
}
