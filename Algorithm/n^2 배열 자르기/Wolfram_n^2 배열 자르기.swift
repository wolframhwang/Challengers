// 211202 solved by Wolfram Hwang
// 간단한 수학.
import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var answer: [Int] = []
    var i = Int(left) / n
    var j = Int(left) % n
    for _ in left...right {
        let now = max(i, j) + 1
        answer.append(now)
        j += 1
        if j >= n {
            i += 1
            j = 0
        }
    }
    return answer
}
