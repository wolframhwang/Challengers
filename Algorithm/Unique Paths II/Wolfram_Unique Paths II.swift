// 21 12 30 solved by Wolfram Hwang
// Use DP
// 그냥.. 경로 찾기 문제에서 Obstacle에 대한 조건만 추가하면 끝남
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {		
        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
		dp[0][0] = obstacleGrid[0][0] == 0 ? 1: 0
		for i in 1..<obstacleGrid.count {
			if obstacleGrid[i][0] == 1 {
				break
			}
			dp[i][0] = dp[i - 1][0]
		}
		for i in 1..<obstacleGrid[0].count {
			if obstacleGrid[0][i] == 1 {
				break
			}
			dp[0][i] = dp[0][i - 1]
		}
		for i in 1..<obstacleGrid.count {
			for j in 1..<obstacleGrid[i].count {
				if obstacleGrid[i][j] == 1 { continue }
				dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
			}
		}
		return dp[obstacleGrid.count - 1][obstacleGrid[0].count - 1]
    }
}
