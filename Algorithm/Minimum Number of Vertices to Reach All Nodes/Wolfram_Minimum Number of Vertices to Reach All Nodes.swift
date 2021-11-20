// 211120 solved by Wolfram Hwang
// node에서 edge의 시작점인 부분만 남겨두면 됨ㅎㅎ
class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var nodes = [Int](repeating: 0, count: n)
        var ret = [Int]()
        
        let range = 0..<edges.count
        for i in range {
            nodes[edges[i][0]] = 1
        }
        
        for i in range {
            nodes[edges[i][1]] = 0
        }
        
        for i in 0..<n {
            if nodes[i] == 1 {
                ret.append(i)
            }
        }
        return ret
    }
}
