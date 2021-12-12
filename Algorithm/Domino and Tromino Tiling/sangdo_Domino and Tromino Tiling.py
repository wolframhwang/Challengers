class Solution:
    def numTilings(self, n: int) -> int:
        dp = [[0]*1001 for _ in range(2)]
        dp[0][0] = 1
        dp[1][0] = 1
        dp[0][1] = 1
        dp[1][2] = 1
        M = 1_000_000_000 +7
        for i in range(2, n+1):
            dp[0][i] = (dp[0][i-1] + dp[0][i-2]) % M
            dp[0][i] = (dp[1][i-1]*2 %M + dp[0][i]) %M
            dp[1][i] = (dp[0][i-2] + dp[1][i-1])%M
        return dp[0][n]
