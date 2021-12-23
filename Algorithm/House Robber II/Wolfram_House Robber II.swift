// 21 12 24 solved by Wolfram Hwang
// DP 를 4행 x N열 배열로 풀었는데,
// 맨 앞에 것만.. 잘 체크해서 돌려주면 굳이 4행으로 할 필요없을것이지만
// 놀랍게도 생각하기 귀찮아서..그만..

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count : 4)
		dp[1][0] = nums[0]
		let last = nums.last!
		let l = nums.count - 1
		for i in 1..<nums.count {
			dp[1][i] = dp[0][i - 1] + (i == nums.count - 1 ? 0: nums[i])
			dp[0][i] = max(dp[1][i - 1], dp[0][i - 1])
		}
		for i in 1..<nums.count {
			dp[3][i] = dp[2][i - 1] + nums[i]
			dp[2][i] = max(dp[2][i - 1], dp[3][i - 1])
		}
		return max(max(dp[3][l], dp[2][l]), max(dp[1][l], dp[0][l]))
    }
} 
