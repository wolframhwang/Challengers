// 211209 solved by Wolfram Hwang
// using DP

class Solution {
    func tribonacci(_ n: Int) -> Int {
        var dp : [Int] = [Int](repeating: 0, count: n + 10)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1
        if n < 3 {
            return dp[n]
        }
        for i in 3...n {
            dp[i] = dp[i - 3] + dp[i - 1]  + dp[i - 2]
        }
        return dp[n]
    }
}
