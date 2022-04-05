//
//  [Toni] Relative Ranks.swift
//  LeetCode
//
//  Created by Sunwoo on 2022/04/06.
//

import Foundation

class Solution29 {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        var scores = score
        var result = [String](repeating: "", count: scores.count)       // 해당 갯수만큼의 배열생성
        var rank = 1                                                    // rank 는 1부터
        
        while scores.count >= rank {                                    // score 갯수만큼 돈다
            let max = scores.max()!                                     // 1등 점수를 찾아서
            let maxIndex = scores.firstIndex(of: max)!                  // 인덱스를 찾고
            result[maxIndex] = String(rank)                             // 아까 만든 배열의 인덱스에 rank를 넣는다. 처음엔 1이겟죠
            rank += 1                                                   // 다음순위를 위해 +1
            scores[maxIndex] = -1                                       // 1등은 이제 필요없으니.... -1로...점수는 0점부터그든요..더좋은방법있나요?
        }
        
        let answer = result.map { ranking -> String in                  // 이거 -> String 안쓰면 에러나던데 그게 return 때문?
//            $0 == "1" ? "Gold Medal" : $0                             // 저 이런거 쓰고 싶어요...
            switch ranking {                                            // 이거 return 안쓰고는 어케 해결하나유
            case "1":
                return "Gold Medal"
            case "2":
                return "Silver Medal"
            case "3":
                return "Bronze Medal"
            default:
                return ranking
            }
        }

        return answer
    }
}
