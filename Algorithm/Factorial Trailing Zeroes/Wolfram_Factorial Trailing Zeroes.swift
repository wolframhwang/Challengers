// 22 02 08 solved by Wolfram hwang
// 단순한 계산문제, 실제로 0은, 총 곱해지는 숫자에서 5의 개수만큼 지니게됨
// 
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        if n <= 1 { return 0}
        var div = 5

        var cnt = 0
        while n / div != 0 {
            cnt += n / div
            div *= 5
        }
        return cnt
    }
}
