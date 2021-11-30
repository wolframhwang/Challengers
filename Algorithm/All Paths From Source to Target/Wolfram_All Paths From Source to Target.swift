// 211130 solved by Wolfram Hwang
// using DFS

class Solution {
    var answer : [[Int]] = []
    var map : [[Int]] = []
    var inp : [Int] = []
    var visit: [Int] = []
    func recur(_ now: Int) {
        var isGo = false        
        for next in map[now] {
            if visit[next] == 0 {
                isGo = true
                visit[next] = 1
                inp.append(next)
                recur(next)
                visit[next] = 0
                inp.removeLast()
            }    
        }
        if now == map.count - 1 {
            answer.append(inp)
        }
    }
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        map = graph
        visit = [Int](repeating: 0, count: graph.count)

        inp.append(0)
        recur(0)
        return answer
    }
}
