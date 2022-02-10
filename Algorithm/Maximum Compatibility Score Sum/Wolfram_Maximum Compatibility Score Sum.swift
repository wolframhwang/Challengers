class Solution {
    var m = 0
    var n = 0
    var map : [[Int]] = []
    var visit: [Bool] = []
    var answer = 0

    func checker(_ A: [Int], _ B: [Int]) -> Int {
        var ret = 0
        for i in 0..<n {
            if A[i] == B[i] {
                ret += 1
            }
        }
        return ret
    }
    func reCur(_ row: Int, _ sum: Int) {
        if row == m {
            if sum > answer {
                answer = sum
            }
            return
        }
        for i in 0..<m {
            if visit[i] == true { continue }
            visit[i] = true
            reCur(row + 1, sum + map[row][i])            
            visit[i] = false
        }
    }
    func maxCompatibilitySum(_ students: [[Int]], _ mentors: [[Int]]) -> Int {
        m = students.count
        n = students[0].count
        map = [[Int]](repeating: [Int](repeating: 0, count: m), count: m)
        visit = [Bool](repeating: false, count: m)
        for i in 0..<m {
            for j in 0..<m {
                map[i][j] = checker(students[i], mentors[j])
            }
        }
        reCur(0, 0)
        return answer
    }
}
