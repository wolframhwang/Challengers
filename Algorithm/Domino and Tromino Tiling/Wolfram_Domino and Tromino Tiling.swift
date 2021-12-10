// 211210 solved by Wolfram Hwang
// using Dynamic Programming Method

class Solution {
    func numTilings(_ n: Int) -> Int {
        var dp :[Int] = [Int](repeating: 0, count: n + 10)
        let mod = Int(1e9) + 7
        dp[0] = 1
        dp[1] = 1
        dp[2] = 2
        if n < 3 {
            return dp[n]
        }
        for i in 3...n {
            dp[i] = (dp[i - 1] * 2 + dp[i - 3]) % mod
        }
        return dp[n]
    }
}
