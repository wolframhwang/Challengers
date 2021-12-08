// 211208 solved by Wolfram Hwang
// 풀이 방법이 여러가지 있는 문제인데, 나는 DP로 했다.
// 접근 법 중에 
// Approach #4: Binary Search with Rolling Hash [Accepted]
// 라는게있는데 이거 봐보면 좋을듯 진짜 처음 보는 방식, 
class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var answer = 0
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
        for i in (0..<nums1.count).reversed() {
            for j in (0..<nums2.count).reversed() {
                if nums1[i] == nums2[j] {
                    dp[i][j] = dp[i + 1][j + 1] + 1
                    if answer < dp[i][j] { answer = dp[i][j] }
                }
            }
        }
        return answer
    }
}
