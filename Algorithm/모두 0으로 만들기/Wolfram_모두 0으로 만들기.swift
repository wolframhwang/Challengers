// 211127 solved by wolfram
// tree DP
import Foundation
var graph: [[Int]] = [[Int]]()
var visit: [Int] = [Int]()
var dp: [[Int64]] = [[Int64]]()
var value: [Int] = [Int]()

func go(_ now: Int, _ parent: Int){
    visit[now] = 1
    for next in graph[now] {
        if visit[next] == 0 {
            go(next, now)
        }
    }
    if parent != now{
        dp[parent][0] += dp[now][0] + Int64(-value[now])
        dp[parent][1] += dp[now][1] + Int64(abs(value[now]))
        value[parent] += value[now]
        value[now] = 0             
    }
}

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    let len = a.count
    value = a
    visit = [Int](repeating: 0, count: len)
    let lay = [Int]()
    graph = [[Int]](repeating: lay, count: len)
    
    let layer = [Int64](repeating: 0, count: 2)
    dp = [[Int64]](repeating: layer, count : len)
    

    for x in edges {
        graph[x[0]].append(x[1])
        graph[x[1]].append(x[0])
    }   
    go(0,0)
    // print(dp)
    // print(value)
    if value[0] == 0 {
        return dp[0][1]
    }else{
        return -1
    }
}
