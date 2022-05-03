//
//  Math Expression Max.swift
//  Programmers 수식 최대화
//
//  Created by Sunwoo on 2022/05/03.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    var arr: [String] = []
    var num = ""
    var set = Set<String>()
    var maxValue: Int64 = 0
    
    expression.forEach { c in
        if c.isNumber {
            num += String(c)
        } else {
            arr.append(num)
            arr.append(String(c))
            set.insert(String(c))
            num = ""
        }
    }
    arr.append(num)
    // *+- *-+ +-* +*- -+* -*+ // +- -+ // *- -* // *+ +*
    print(arr)
    if set.count == 3 {
        //*+-
        var arr1 = arr
        while arr1.contains("*") {
            let index = arr1.firstIndex(of: "*")!
            arr1.remove(at: index)
            arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("+") {
            let index = arr1.firstIndex(of: "+")!
            arr1.remove(at: index)
            arr1[index] = plus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("-") {
            let index = arr1.firstIndex(of: "-")!
            arr1.remove(at: index)
            arr1[index] = minus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        maxValue = Int64(abs(Int(arr1[0])!))
        print(maxValue)
        //*-+
        arr1 = arr
        while arr1.contains("*") {
            let index = arr1.firstIndex(of: "*")!
            arr1.remove(at: index)
            arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("-") {
            let index = arr1.firstIndex(of: "-")!
            arr1.remove(at: index)
            arr1[index] = minus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("+") {
            let index = arr1.firstIndex(of: "+")!
            arr1.remove(at: index)
            arr1[index] = plus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
       
        maxValue = max(maxValue, abs(Int64(arr1[0])!))
        
        //+*-
        arr1 = arr
        while arr1.contains("+") {
            let index = arr1.firstIndex(of: "+")!
            arr1.remove(at: index)
            arr1[index] = plus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("*") {
            let index = arr1.firstIndex(of: "*")!
            arr1.remove(at: index)
            arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
       
        while arr1.contains("-") {
            let index = arr1.firstIndex(of: "-")!
            arr1.remove(at: index)
            arr1[index] = minus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        maxValue = max(maxValue, abs(Int64(arr1[0])!))
        
        //+-*
        arr1 = arr
        while arr1.contains("+") {
            let index = arr1.firstIndex(of: "+")!
            arr1.remove(at: index)
            arr1[index] = plus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
       
        while arr1.contains("-") {
            let index = arr1.firstIndex(of: "-")!
            arr1.remove(at: index)
            arr1[index] = minus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("*") {
            let index = arr1.firstIndex(of: "*")!
            arr1.remove(at: index)
            arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        maxValue = max(maxValue, abs(Int64(arr1[0])!))
        
        //-*+
        arr1 = arr
        while arr1.contains("-") {
            let index = arr1.firstIndex(of: "-")!
            arr1.remove(at: index)
            arr1[index] = minus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("*") {
            let index = arr1.firstIndex(of: "*")!
            arr1.remove(at: index)
            arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("+") {
            let index = arr1.firstIndex(of: "+")!
            arr1.remove(at: index)
            arr1[index] = plus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }

        maxValue = max(maxValue, abs(Int64(arr1[0])!))
        
        //-+*
        arr1 = arr
        while arr1.contains("-") {
            let index = arr1.firstIndex(of: "-")!
            arr1.remove(at: index)
            arr1[index] = minus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        while arr1.contains("+") {
            let index = arr1.firstIndex(of: "+")!
            arr1.remove(at: index)
            arr1[index] = plus(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
       
        while arr1.contains("*") {
            let index = arr1.firstIndex(of: "*")!
            arr1.remove(at: index)
            arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
            arr1.remove(at: index-1)
        }
        
        maxValue = max(maxValue, abs(Int64(arr1[0])!))
   
    } else if set.count == 2 { //+- -+ / -* *-/// *+ +*
        if set.contains("+") && set.contains("-") {
            var arr1 = arr
            while arr1.contains("+") {
                let index = arr1.firstIndex(of: "+")!
                arr1.remove(at: index)
                arr1[index] = plus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            while arr1.contains("-") {
                let index = arr1.firstIndex(of: "-")!
                arr1.remove(at: index)
                arr1[index] = minus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
            
            arr1 = arr
            while arr1.contains("-") {
                let index = arr1.firstIndex(of: "-")!
                arr1.remove(at: index)
                arr1[index] = minus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            while arr1.contains("+") {
                let index = arr1.firstIndex(of: "+")!
                arr1.remove(at: index)
                arr1[index] = plus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
        } else if set.contains("-") && set.contains("*") {
            var arr1 = arr
            while arr1.contains("*") {
                let index = arr1.firstIndex(of: "*")!
                arr1.remove(at: index)
                arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            while arr1.contains("-") {
                let index = arr1.firstIndex(of: "-")!
                arr1.remove(at: index)
                arr1[index] = minus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
            
            arr1 = arr
            while arr1.contains("-") {
                let index = arr1.firstIndex(of: "-")!
                arr1.remove(at: index)
                arr1[index] = minus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            while arr1.contains("*") {
                let index = arr1.firstIndex(of: "*")!
                arr1.remove(at: index)
                arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
         
        } else {
            var arr1 = arr
            while arr1.contains("*") {
                let index = arr1.firstIndex(of: "*")!
                arr1.remove(at: index)
                arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            while arr1.contains("+") {
                let index = arr1.firstIndex(of: "+")!
                arr1.remove(at: index)
                arr1[index] = plus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
            
            arr1 = arr
            while arr1.contains("+") {
                let index = arr1.firstIndex(of: "+")!
                arr1.remove(at: index)
                arr1[index] = plus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            while arr1.contains("*") {
                let index = arr1.firstIndex(of: "*")!
                arr1.remove(at: index)
                arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
          
        }
    } else {
        if set.contains("+") {
            var arr1 = arr
            while arr1.contains("+") {
                let index = arr1.firstIndex(of: "+")!
                arr1.remove(at: index)
                arr1[index] = plus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
        } else if set.contains("*") {
            var arr1 = arr
            while arr1.contains("*") {
                let index = arr1.firstIndex(of: "*")!
                arr1.remove(at: index)
                arr1[index] = multiply(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
        } else {
            var arr1 = arr
            while arr1.contains("-") {
                let index = arr1.firstIndex(of: "-")!
                arr1.remove(at: index)
                arr1[index] = minus(front: arr1[index-1], back: arr1[index])
                arr1.remove(at: index-1)
            }
            maxValue = max(maxValue, abs(Int64(arr1[0])!))
        }
    }

    return maxValue
}

func minus(front: String, back: String) -> String {
    return String(Int64(front)! - Int64(back)!)
}

func plus(front: String, back: String) -> String {
    return String(Int64(front)! + Int64(back)!)
}

func multiply(front: String, back: String) -> String {
    return String(Int64(front)! * Int64(back)!)
}
