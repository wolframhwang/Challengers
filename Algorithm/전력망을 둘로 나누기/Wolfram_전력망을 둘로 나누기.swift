// 211109 solved by Wolfram Hwang
// Using BFS

import Foundation
func bfs(_ map: [[Bool]], _ visit: inout [Bool], _ start: Int)-> Int {    
    var ret = 1
    var q: [Int] = [start]
    var front = 0
    var rear = 1
    while front != rear {
        let now = q[front]
        front += 1
        for i in (1..<map[now].count) {
            if map[now][i] == true, visit[i] == false {
                visit[i] = true
                q.append(i)
                ret += 1
                rear += 1
            }
        }
    }
    return ret
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = 987654321
    var map : [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n + 1),count: n + 1)
    for w in wires {
        map[w[0]][w[1]] = true
        map[w[1]][w[0]] = true
    }
    for i in 0..<wires.count {
        var ap = [Int]()
        if i > 0 {
            map[wires[i - 1][0]][wires[i - 1][1]] = true
            map[wires[i - 1][1]][wires[i - 1][0]] = true
        }
        map[wires[i][0]][wires[i][1]] = false
        map[wires[i][1]][wires[i][0]] = false
        var visit = [Bool](repeating: false, count: n + 1)
        for i in 1...n {
            if visit[i] == false {
                visit[i] = true
                ap.append(bfs(map, &visit, i))
            }
        }
        if ap.count != 2 { continue }
        let ret = abs(ap[0] - ap[1])
        answer = ret < answer ? ret : answer            
    }
    if answer == 987654321 {
        answer = 0
    }
    return answer
}
