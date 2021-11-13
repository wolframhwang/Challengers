// 211113 Solved by Wolfram Hwang
// Monotonic Stack
// 값이 커진 값이 나왔을때, 보관해 두는것이 포인트
// 그렇게 되면 한번의 순회로 찾기가 가능함.O(N)은 아님

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = [Int](repeating: 0, count: temperatures.count)
        var stack : [(Int, Int)] = []
        
        for i in 0..<temperatures.count {
            if stack.isEmpty {
                stack.append((temperatures[i], i))
            }else {
                while !stack.isEmpty {
                    let top = stack.last!
                    if top.0 < temperatures[i] {
                        //print(top.0, temperatures[i])
                        answer[top.1] = i - top.1
                        stack.removeLast()
                    }else {
                        break
                    }
                }
                stack.append((temperatures[i], i))
            }
        }
        return answer
    }
}
