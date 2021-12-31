// 21 12 31 solved by Wolfram Hwang
// Using Tree DP 
// CPP 가 편한 곳에서 풀었음;
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include<vector>

using namespace std;

#define max(a, b) (((a) > (b)) ? (a) : (b))
#define MAX 10001

vector<int> map[MAX];

int value[MAX];
int N;
int dp[2][MAX];
bool visit[MAX];

void recur(int now, int parent) {
	for(register int i = 0; i < map[now].size(); i++) {
		register int next = map[now][i];
		if (visit[next]) continue;
		//printf("next %d\n", next );
		visit[next] = true;
		recur(next, now);
	}
	for(register int i = 0; i < map[now].size(); i++) {
		register int next = map[now][i];
		if (map[now][i] == parent) continue;
		dp[1][now] += dp[0][next];
		dp[0][now] += max(dp[0][next], dp[1][next]);
	}
	
}

int main() {
	scanf("%d", &N);
	for (int i = 1; i <= N; i++) {
		scanf("%d", &value[i]);
		dp[1][i] = value[i];
	}
	int a, b;
	for (int i = 0; i < N - 1; i++) {
		scanf("%d %d", &a, &b);
		map[a].push_back(b);
		map[b].push_back(a);
	}
	visit[1] = true;
	recur(1, 0);
	printf("%d\n", max(dp[1][1], dp[0][1]));
	return 0;
}
