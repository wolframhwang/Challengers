// 211111 빼빼로 데이 문제!
// 2분탐색으로 풀어도 좋지않을지;

class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        var minn = 0
        var total = 0
        
        for num in nums {
            total += num
            minn = min(minn, total)
        }
        return (-minn) + 1
    }
}
