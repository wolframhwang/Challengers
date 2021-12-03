// 211203 solved by Wolfram Hwang
// using dp
// 점화식은 매우 간단하다.
// 음수 나오고, 그다음에는 인덱스를 한칸씩 밀어주는데,
// 양수, 음수 두가지 바이너리라서 2xn 배열이 추가적으로 더 필요함!

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count: 2)
        if nums[0] < 0 { dp[1][0] = nums[0]}
        else { dp[0][0] = nums[0] }
        var answer = dp[0][0] > dp[1][0] ? dp[0][0]: dp[1][0]   
        for i in 1..<nums.count {
            if nums[i] < 0 {
                dp[0][i] = dp[1][i - 1] == 0 ? 0: nums[i] * dp[1][i - 1]
                dp[1][i] = dp[0][i - 1] == 0 ? nums[i] : nums[i] * dp[0][i - 1]
            }else {
                dp[0][i] = dp[0][i - 1] == 0 ? nums[i] : nums[i] * dp[0][i - 1]
                dp[1][i] = dp[1][i - 1] == 0 ? 0: nums[i] * dp[1][i - 1]
            }
            
            if answer < dp[0][i] {
                answer = dp[0][i]
            }
            if answer < dp[1][i] {
                answer = dp[1][i]
            }
        }
        return answer
    }
}
