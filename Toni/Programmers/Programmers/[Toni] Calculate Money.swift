//
//  [Toni] Calculate Money.swift
//  Programmers 부족한 금액 계산하기
//
//  Created by Sunwoo on 2022/04/18.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer: Int64 = 0
    
    for i in 1...count {
        answer += Int64(price * i)
    }
    answer -= Int64(money)
    if answer < 0 {
        answer = 0
    }
    
    return answer
}
