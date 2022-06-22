//
//  test3.swift
//  Programmers
//
//  Created by Sunwoo on 2022/06/12.
//

import Foundation

func solution19(_ n:Int, _ plans:[String], _ clients:[String]) -> [Int] {
    var dataPlans : [Int: [Int]] = [:]
    var service = [Int]()
    var answer = [Int]()
    
    for i in 0..<plans.count {
        let separate = plans[i].components(separatedBy: " ")
    
        for j in 1..<separate.count {
            service.append(Int(separate[j])!)
        }
        
        dataPlans.updateValue(service, forKey: Int(separate[0])!)
    }
    
    let sortedPlans = dataPlans.sorted { $0.key < $1.key }
    
    for i in 0..<clients.count {
        var clientPlans = clients[i].components(separatedBy: " ")
        let data = Int(clientPlans[0])!
        clientPlans.removeFirst()
        
        let cPlan = clientPlans.map { a in
            Int(a)!
        }
        
        for j in 0..<sortedPlans.count {
            var count = 0
            if data > sortedPlans[j].key {
                continue
            }
            
            for clientPlan in cPlan {
                if sortedPlans[j].value.contains(clientPlan) {
                    count += 1
                }
                
                if count == cPlan.count {
                    answer.append(j+1)
                    break
                }
            }

        }
    }
    
    print(answer)
    
    
    
    return answer
}

