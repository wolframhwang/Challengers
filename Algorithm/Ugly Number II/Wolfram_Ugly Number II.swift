// 22 01 21 solved by Wolfram Hwang
// Using DP
// 매우간단한 문제, 포인터 세개로 계속 왔다갔다 하면 됌!

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        if n <= 0 {
			return 0
		}
		if n == 1 { return 1 }
		var p2 = 0
		var p3 = 0
		var p5 = 0
		var dp : [Int] = [Int](repeating: 0, count: n)

		dp[0] = 1
		for i in 1..<n {
			dp[i] = min(dp[p2] * 2, min(dp[p3] * 3, dp[p5] * 5))
			if dp[i] == dp[p2] * 2 { p2 += 1 }
			if dp[i] == dp[p3] * 3 { p3 += 1 }
			if dp[i] == dp[p5] * 5 { p5 += 1 }

		}
		return dp[n - 1]
    }
}
