// 21 12 27 solved by Wolfram Hwang
// Use DP
// House Robber랑 개념은 똑같네요, 다만, 숫자를 축으로 사용한다는게 다른점인거같아요.

class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
		  var arr: [Int] = [Int](repeating: 0, count: 10001)
		  var st: Set<Int> = Set<Int>()
		  var MX = 0
		  for i in 0..<nums.count {
			  arr[nums[i]] += 1
			  st.insert(nums[i])
			  if MX < nums[i] {
				  MX = nums[i]
			  }
		  }

		  for c in st {
			  arr[c] = c * arr[c]
		  }
		  var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10001), count: 2)
		  for i in 1...MX {
			  dp[1][i] = dp[0][i - 1] + arr[i]
			  dp[0][i] = max(dp[0][i - 1], dp[1][i - 1])
		  }
		  return max(dp[1][MX], dp[0][MX])
    }
}
