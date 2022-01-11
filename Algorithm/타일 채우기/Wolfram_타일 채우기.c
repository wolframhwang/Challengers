// 22 01 11 solved by Wolfram Hwang
// Using DP..
// dp[2] 일 경우 3, dp[4] 일경우에는 dp[2] * 3 + ... 인데.. 이게 dp[4]일때 생기는 특이한것이 2가지가있어서
// dp[i] += (dp[j] * 2) 을 계속 이어나가면서 답을 구해야함

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int dp[31];

int main() {
	int N;
	scanf("%d", &N);
	if (N % 2 != 0) { printf("0\n"); return 0; }
	dp[0] = 1;
	dp[2] = 3;
	for (int i = 4; i <= N; i += 2) {
		dp[i] = dp[i - 2] * dp[2];
		for (int j = i - 4; j >= 0; j -= 2) {
			dp[i] += (dp[j] * 2);
		}
	}
	printf("%d\n", dp[N]);
	return 0;
}
