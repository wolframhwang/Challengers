// 22 01 13 solved by Wolfram Hwang
// Using DP, 길찾기랑 똑같음

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
typedef long long ll;
ll dp[201][201];
ll MOD = 1000000000;
int N, K;

int main() {
	scanf("%d %d", &N, &K);
	for (int i = 0; i <= N; i++) {
		dp[i][1] = 1;
	}
	for (int i = 1; i <= K; i++) {
		dp[0][i] = 1;
	}

	for (int i = 1; i <= N; i++) {
		for (int j = 2; j <= K; j++) {
			dp[i][j] = (dp[i - 1][j] + dp[i][j - 1]) % MOD;
		}
	}

	printf("%lld\n", dp[N][K]);
	return 0;
}
