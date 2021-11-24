// 211124 solved  by Wolfram Hwang
// using BFS
import Foundation
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var char : [[Character]] = []
var map : [[[Int]]] = []
func bfs(_ x: Int, _ y : Int, _ d: Int)-> Int {
    map[d][x][y] = 1
    var q: [(Int, Int, Int)]  = [(x, y, d)]
    var rear = 1
    var front = 0
    while front != rear {
        let xx = q[front].0
        let yy = q[front].1
        let dd = q[front].2
        front += 1
        var nd = 0
        var nx = 0
        var ny = 0
        if char[xx][yy] == "R" {
            nd = (dd + 1) % 4            
        }else if char[xx][yy] == "L" {
            nd = (dd - 1)
            if nd < 0 { nd += 4 }
        }else {
            nd = dd
        }
        nx = xx + dx[nd] 
        ny = yy + dy[nd]
        if nx < 0 {
            nx += char.count
        }
        if nx >= char.count {
            nx %= char.count
        }
        if ny < 0 {
            ny += char[0].count
        }
        if ny >= char[0].count {
            ny %= char[0].count
        }
        if map[nd][nx][ny] == 0 {
            map[nd][nx][ny] = map[dd][xx][yy] + 1
            q.append((nx, ny, nd))
            rear += 1
        }else {
            if x == nx, y == ny, d == nd {
                return map[dd][xx][yy]
            }
        }
    }
    return 0
}

func solution(_ grid:[String]) -> [Int] {
    map = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating:0, count: grid[0].count), count: grid.count),count: 4)
    char = [[Character]](repeating: [Character](repeating: " ", count: grid[0].count), count: grid.count)
    var idx = 0
    for s in grid {
        var jdx = 0
        for c in s {
            char[idx][jdx] = c
            jdx += 1
        }
        idx += 1
    }
    //print(map.count)
//    return []
    var answer = [Int]()
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            for k in 0..<4 {
                if map[k][i][j] == 0 {
                    let val = bfs(i, j, k)
                    if val > 0 {
                        answer.append(val)
                    }
                }
            }
        }
    }
    return answer.sorted()
}
