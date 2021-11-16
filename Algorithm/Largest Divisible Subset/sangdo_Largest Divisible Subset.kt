class Solution {
    fun largestDivisibleSubset(nums: IntArray): List<Int> {
        nums.sort()
        var res = 0
        var idx = 0
        var dp = IntArray(nums.size){1}
        var backtrace = IntArray(nums.size){-1}
        dp[0] = 1
        for(i in 0 until nums.size) {
            for(j in i+1 until nums.size) {
                if(nums[j] % nums[i] == 0) {
                    if(dp[j] < dp[i] + 1) {
                        dp[j] = dp[i] + 1
                        backtrace[j] = i
                    }
                }
            }
            if(res < dp[i]) {
                res = dp[i]
                idx = i
            }
        }
        var arr = ArrayList<Int>()
        while(idx != -1) {
            arr.add(nums[idx])
            idx = backtrace[idx]
        }
        return arr.reversed()
    }
}
