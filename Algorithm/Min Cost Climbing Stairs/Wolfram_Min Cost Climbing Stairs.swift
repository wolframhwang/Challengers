// 21 12 23 solved by Wolfram Hwang
// USE DP

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp : [Int] = [Int](repeating: 0, count: cost.count + 1)
		dp[0] = cost[0]
		dp[1] = cost[1]
		for i in 2..<cost.count {
			dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
		}
        let n = cost.count
		return min(dp[n - 1], dp[n - 2])
    }
}
