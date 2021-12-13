// 21 12 13 solved by wolfram hwang
// dp
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, {(first: Int, second: Int) -> Int in
    return first + second})
        
        if sum % 2 != 0 {
            return false
        }
        
        let w = sum / 2
        
        var dp = [Bool](repeating: false, count: w + 1)
        dp[0] = true
        for num in nums {
            for i in (1...w).reversed() {
                if num <= i {
                    dp[i] = dp[i] || dp[i-num]
                }
            }
        }
        return dp[w]
    }
}
