//
//  [Toni] Dart Game.swift
//  Programmers 다트 게임
//
//  Created by Sunwoo on 2022/04/17.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    var dart = dartResult
    let score = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]                          // 해당 숫자가 들어오는지 판단하기 위한 배열
    let bonus = ["S", "D", "T"]                                                            // 해당하는 보너스가 들어오는지 판별하기 위함. 이외의 것은 *,#이므로 else문으로 퉁침
    var result: [Int] = []                                                                  // 결과는 앞으로 result 배열에 순서대로 쌓일 것.
    
    while dart.count > 0 {                                                                  // 입력받은 문자열이 없어질때까지 루프
        let first = String(dart.removeFirst())                                              // 첫번째 글자를 따온다
        
        if score.contains(first) {                                                          // 그 글자가 score배열안에 있으면
            if first == "1" {                                                               // 점수가 10점인지, 1점인지 판별해야되기 때문에.. 앞글자가 1이면
                if score.contains(String(dart.first!)) {                                    // 다시 맨 앞이 숫자인지 확인. 그냥 0인지 확인해도 되겠군..
                    dart.removeFirst()                                                      // 맞다면 0도 제거
                    result.append(getScore(num: "10"))                                      // 스코어 얻는 곳에 10점을 넣어준다.
                } else {
                    result.append(getScore(num: first))                                     // 근데 다음 글자가 0이 아니면 1을 넣어주는것.
                }
            } else {                                                                        // 맨앞이 1이 아닐경우
                result.append(getScore(num: first))                                         // 해당 숫자 넣어줌
            }
        } else if bonus.contains(first) {                                                  // 만약 score에 해당하는 게 아니고, bonus에 해당하면
            let last = result.removeLast()                                                  // 점수를 두배 또는 세배 해야되니까 result배열에서 마지막꺼 가져옴
            result.append(getBonus(bonus: first, score: last))                              // 결과를 result에 append
        } else {
            result = getOption(option: first, scoreArr: result)                             // score도 아니고, bonus도 아니면 option
        }
    }
    
    let answer = result.reduce(into: 0) { sum, n in                                         // 배열의 있는 값을 합산
        sum += n
    }
    
    return answer
}

func getScore(num: String) -> Int {
    let answer = Int(num)!                                                                  //숫자는 Int
    
    return answer
}

func getBonus(bonus: String, score: Int) -> Int {
    var answer = score
    
    if bonus == "D" {                                                                       //D가 들어오면
        answer = answer * answer                                                            // 제곱
    } else if bonus == "T" {                                                                //T가 들어오면
        answer = answer * answer * answer                                                   // 세제곱
    }
    
    return answer
}

func getOption(option: String, scoreArr: [Int]) -> [Int] {
    var scores = scoreArr
    if scores.count == 1 {                                                                  // 계산된 점수가 한개일경우
        if option == "*" {
            scores[0] = scores[0] * 2                                                       // 해당 것만 더블
        } else if option == "#" {
            scores[0] = scores[0] * -1                                                      // 또는 -
        } else {
                                                                                        // 빈 else는 위에서 그냥 else처리해버리면 *이 아닌경우에 모두 음수처리할것같았는데 없애도 되겠네
        }
    } else {                                                                                //점수가 두개 이상일 경우~~
        let lastIndex = scores.count - 1
        if option == "*" {
            scores[lastIndex-1] = scores[lastIndex-1] * 2
            scores[lastIndex] = scores[lastIndex] * 2
        } else if option == "#" {
            scores[lastIndex] = scores[lastIndex] * -1
        } else {
            
        }
    }
    
    return scores
}
