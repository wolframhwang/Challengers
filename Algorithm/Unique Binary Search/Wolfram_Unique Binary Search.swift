// 211108 Solved by Wolfram hwang
// Dynamic Programming Problem
// dp[n] += (d[i - 1] * dp[n - i])

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n == 1 { return 1}
        var dp : [Int] = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[i - j] * dp[j - 1]
            }
        }
        return dp[n]
    }
}
