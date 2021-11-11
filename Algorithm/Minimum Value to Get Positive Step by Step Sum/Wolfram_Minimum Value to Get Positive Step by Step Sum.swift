// 211111 빼빼로 데이 문제!
// 2분탐색으로 풀어도 좋지않을지;

class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        for i in 1...10000 {
            var sum = i
            var isFail = false
            for j in nums {
                sum += j
                if sum <= 0 {
                    isFail = true
                    break
                }
            }
            if !isFail { return i}
            
        }
        return 1
        
    }
}
