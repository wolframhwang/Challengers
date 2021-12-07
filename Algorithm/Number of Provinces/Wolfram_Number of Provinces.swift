// 211207 solved by Wolfram Hwang
// Using BFS

class Solution {
    func bfs(_ start: Int, _ visit: inout [Bool], _ map: [[Int]]) {
        var q: [Int] = [start]
        var front = 0
        visit[start] = true
        while q.count != front {
            let now = q[front]
            front += 1
            for i in 0..<map[now].count {
                if visit[i] == false, map[now][i] == 1 {
                    visit[i] = true
                    q.append(i)
                }
            }
        }
        
    }
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var answer = 0
        var visit: [Bool] = [Bool](repeating: false, count: isConnected.count)
        for i in 0..<isConnected.count {
            if visit[i] == false {
                bfs(i, &visit, isConnected)
                answer += 1
            }
        }
        return answer
    }
}
