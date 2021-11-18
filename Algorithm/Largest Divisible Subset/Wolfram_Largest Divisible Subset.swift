// at 211118 solved by Wolfram hwang
// using LIS
class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let arr = nums.sorted()
        let n = nums.count
        var dp = [Int](repeating: 1, count: n)
        var prev = [Int](repeating: -1, count: n)
        var index = 0
        var max = 0
        for i in 0..<n {
            for j in (0..<i).reversed() {
                if dp[j] + 1 > dp[i], arr[i] % arr[j] == 0 {
                    dp[i] = dp[j] + 1
                    prev[i] = j
                }
            }
        }
        for i in 0..<n {            
            if(max < dp[i]){
                max = dp[i];
                index = i;
            }
        }
        
        var ans: [Int] = []
        while index != -1 {
            ans.append(arr[index])
            index = prev[index]
        }
        return ans
    }
}
