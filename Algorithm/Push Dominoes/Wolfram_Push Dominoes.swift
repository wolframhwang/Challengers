// 22 01 07 Not solved by Wolfram Hwang
// 해결을 못해서 답을 봤습니다.
// 오른쪽 한번, 왼쪽 한번 밀고
// 그 뒤에 처리하는 방법까지는 생각을 했는데, 왼쪽, 오른쪽 쌍을 정하는 과정을 길이를 측정해서 하려고 하다보니 실패했습니다. (애초에 RRRL 같은 경우에 실패할 수 밖에 없는 방법)
// 문제 해결방법은
// 오른쪽으로 밀 때, R일 경우 고정된 숫자인 N값을 point 에 업데이트해서 줄여나가는 방식으로 Memoization 합니다.
// 그리고 왼쪽으로 미는 경우에, 오른쪽으로 미는 경우와 같이 L일 경우, point를 업데이트 해주고, 외에는 point를 줄여나가는 방식으로 저장을 하는데, 
// 이때 저장하는 dp에 저장하는 Point는 위상을 반대로 넣어줍니다
// 최종적으로 R....L 인 경우
// 오른쪽 : 6 5 4 3 2 0 
// 왼쪽 :   0 2 3 4 5 6 (음수)
// 최종 : 6 3 1 -1 -3 -6
// 이런식으로 되어, RRR LLL 이라는 최종 결과를 얻어낼수 있게 됩니다.

class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var dom: [Character] = []
        for c in dominoes { dom.append(c) }
        
        var N = dom.count
        var dp : [Int] = [Int](repeating: 0, count: N)
        var point = 0
        let range = 0..<N
        for i in  range{
            if dom[i] == "R" { point = N }
            else if dom[i] == "L" { point = 0 }
            else{ point = max(point - 1, 0)}
            dp[i] += point
        }
        
        point = 0
        for i in range.reversed() {
            if dom[i] == "L" { point = N }
            else if dom[i] == "R" { point = 0 }
            else { point = max(point - 1, 0 )}
            dp[i] -= point
        }
        var answer = ""
        for v in dp {
            if v > 0 {
                answer += "R"
            }
            else if v < 0 {
                answer += "L"
            }else {
                answer += "."
            }
        }
        
        return answer
    }
}
