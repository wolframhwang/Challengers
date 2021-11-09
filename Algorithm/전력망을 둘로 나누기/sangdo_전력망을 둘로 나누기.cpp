#include <string>
#include <vector>
#include<iostream>
#include<cmath>
using namespace std;

int dp[101][101];
int dpsum[101];
int len[101];
vector<int> adj[101];

int getdp(int now, int prev) {
    dpsum[now] = 1;
    for(int i = 0; i < adj[now].size(); ++i) {
        int next = adj[now][i];
        if(next == prev) continue;
        dp[now][i] = getdp(next, now); 
        dpsum[now] += dp[now][i]; 
    } 
    return dpsum[now];
}

int getMin(int now, int prev, int sum) {
    int res = 0x3f3f3f3f;
    for(int i = 0; i < adj[now].size(); ++i) {
        int next = adj[now][i];
        if(next == prev) continue;
        int diff = abs(dpsum[now] + sum - dpsum[next] - dpsum[next]);
        if(diff < res) {
            //cout << now << ' ' << next << ' ' << diff <<  endl;
            res = diff;
        }
        int ret = getMin(next, now, sum + dpsum[now] - dpsum[next]);
        if(ret < res) res = ret;
    }
    return res;
}

int solution(int n, vector<vector<int>> wires) {
    for(int i = 1; i <= n; ++i) adj[i].clear();
    for(int i = 0; i < wires.size(); ++i) {
        int a = wires[i][0];
        int b = wires[i][1];
        adj[a].push_back(b);
        adj[b].push_back(a);
    }
    for(int i = 1; i <= n; ++i) len[i] = adj[i].size(), dpsum[i] = 0;
    getdp(1, -1);
    int answer = -1;
    return getMin(1,-1, 0);
}
