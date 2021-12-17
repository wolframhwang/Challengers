// 21 12 17 solved by Wolfram Hwang
// Use Dynamic Programming -> 스퀘어!

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        var len = 0
        for i in 1...matrix.count {
            for j in 1...matrix[0].count {
                if matrix[i - 1][j - 1] == "1" {
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                    
                    len = max(len, dp[i][j])
                }
            }
        }
        return len * len 
    }
}
