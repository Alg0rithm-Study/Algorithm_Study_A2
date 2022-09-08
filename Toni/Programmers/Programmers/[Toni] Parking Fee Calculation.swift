//
//  [Toni] Parking Fee Calculation.swift
//  Programmers
//
//  Created by Sunwoo on 2022/09/08.
//

import Foundation

func solution24(_ fees:[Int], _ records:[String]) -> [Int] {
    let baseTime = fees[0]
    let baseFee = fees[1]
    let perTime = fees[2]
    let perFee = fees[3]
    
    var parkingDict: [Int: [Int]] = [:]
    var parking: [[String]] = []
    var answer: [Int] = []
    
    for record in records {
        parking.append(record.components(separatedBy: " "))
    }
    
    for park in parking {
        let carNumber = Int(park[1])!
        let parkingTime = timeToMinute(time: park[0])
        if parkingDict[carNumber] == nil {
            parkingDict[carNumber] = [parkingTime]
        } else {
            parkingDict[carNumber]?.append(parkingTime)
        }
    }
    
    for dict in parkingDict {
        if dict.value.count % 2 != 0 {
            let parkingTime = timeToMinute(time: "23:59")
            parkingDict[dict.key]?.append(parkingTime)
        }
    }
    
    let sortedDict = parkingDict.sorted { $0.0 < $1.0 }
    
    print(sortedDict)
    
    for dict in sortedDict {
        var time = 0
        for i in stride(from: 0, to: dict.value.count, by: 2) {
            time += (dict.value[i+1] - dict.value[i])
        }
        
        var result = baseFee + Int(ceil(((Double(time) - Double(baseTime)) / Double(perTime)))) * perFee
        if result < baseFee {
            result = baseFee
        }
        answer.append(result)
    }
    
    return answer
}

func timeToMinute(time: String) -> Int {
    let timeArr = time.components(separatedBy: ":")
    
    return Int(timeArr[0])! * 60 + Int(timeArr[1])!
}
