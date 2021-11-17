// 211118 solved by Wolfram Hwang
// Using Two Pointer

class Solution {
    func reverseWords(_ s: String) -> String {
        let splitWords = s.split(separator: " ")
        var strSet = [String](repeating: "", count: splitWords.count)
        var s = 0
        var e = splitWords.count - 1
        while s <= e {
            strSet[s] = String(splitWords[e])
            strSet[e] = String(splitWords[s])
            s += 1
            e -= 1
        }
        var answer = ""
        for i in 0..<strSet.count {
            answer += strSet[i]
            if i != strSet.count - 1 {
                answer += " "
            }
        }
        return answer
    }
}
