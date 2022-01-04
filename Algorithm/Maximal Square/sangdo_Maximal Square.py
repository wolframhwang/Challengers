class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        dp = [[0] * len(matrix[0]) for _ in range(len(matrix))]
        res = 0
        for i in range(len(matrix)):
            for j in range(len(matrix[0])):
                if matrix[i][j] == '1':
                    u = dp[i-1][j] if i else 0
                    l = dp[i][j-1] if j else 0
                    lu = dp[i-1][j-1] if i and j else 0
                    dp[i][j] = min(l,u,lu) + 1
                    res = max(res,dp[i][j]*dp[i][j])
                    
        return res 
