#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int map[101][101];

void reset(bool visited[101]) {
	for (int i = 0; i < 101; i++)
		visited[i] = false;
}

int bfs(int start) {
	
	bool visited[101];
	reset(visited);

	queue<int> q;
	q.push(start);

	int cnt = 0;

	while (!q.empty()) {
		int cur = q.front();
		visited[cur] = true;
		q.pop();

		cnt++;

		for (int i = 1; i < 101; i++) {
			if (map[cur][i] && (visited[i] == false)) {
				q.push(i);
				visited[i] = true;
			}
		}
	}

	return cnt;
}

int solution(int n, vector<vector<int>> wires) {

	if (wires.size() == 2)
		return 0;

	for (int i = 0; i < wires.size(); i++) {
		map[wires[i][0]][wires[i][1]] = 1;
		map[wires[i][1]][wires[i][0]] = 1;
	}

	int min = 0x0fffffff;

	for (int i = 0; i < wires.size(); i++) {
	
		int from = wires[i][0];
		int to = wires[i][1];

		map[from][to] = 0;
		map[to][from] = 0;

		int res = abs(bfs(from) - bfs(to));

		map[from][to] = 1;
		map[to][from] = 1;

		if (min > res)
			min = res;
	}

	return min;
}