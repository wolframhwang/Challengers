// 22 01 10 solved by Wolfram Hwang
// Using DP !!!!
// 점화식 세우는게 까다로워보이는데, 그냥 선택 할지 말지의 문제가 더 큰 것 같다.
class Solution {
    func numDecodings(_ s: String) -> Int {
		var carr: [Character] = []
		for c in s { carr.append(c) }
        var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: s.count), count : 2)
		if carr[0] != "0" { dp[1][0] = 1 }
		for i in 1..<s.count {
			if carr[i - 1] != "0" {
				let str: String = String(carr[i - 1]) + String(carr[i])
				if Int(str)! <= 26 { dp[0][i] = dp[1][i - 1] }
			}
            if carr[i] != "0" { dp[1][i] = dp[1][i - 1] + dp[0][i - 1] }
		}
		let n = s.count
		return dp[0][n - 1] + dp[1][n - 1]
    }
}
