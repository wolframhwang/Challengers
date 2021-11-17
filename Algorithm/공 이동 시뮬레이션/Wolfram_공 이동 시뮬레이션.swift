// 211117 solved by Wolfram Hwang
// 문제가 좀 까다롭다.
// DP든 메모이제이션이든 10의 9승이나 배열 20만개에 해당하는 메모이제이션을 만들기 어려울것같고
// 생각해본게 범위 를 통해 얻어내는건아닐까? 하는거였다.
// -> 가능한 곳의 범위 찾아서 값 구하기!

import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    var xy = [y, y + 1, x, x + 1]
    var dir = [-1, 1, -1, 1]
    var bound = [0, m, 0, n]
    var MX = [m, m, n, n]
    
    for q in queries.reversed() {
        let cmd = q[0]
        let dx = q[1]
        
        let directionReverse = cmd ^ 1
        xy[directionReverse] += dir[directionReverse] * dx
        let isBoundary = min(xy[directionReverse], MX[directionReverse])
        xy[directionReverse] = max(isBoundary, 0)
        
        if xy[cmd] != bound[cmd] {
            xy[cmd] += dir[directionReverse] * dx
            xy[cmd] = max(min(xy[cmd], MX[cmd]), 0)
        }
        
        if xy[0] == m || xy[1] == 0 || xy[2] == n || xy[3] == 0 {
            return 0
        }
    }
    
    return Int64((xy[1] - xy[0]) * (xy[3] - xy[2]))
}
