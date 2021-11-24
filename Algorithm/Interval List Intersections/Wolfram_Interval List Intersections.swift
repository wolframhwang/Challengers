// 21 11 25 solved by Wolfram Hwang
// Use Two Pointer // Sliding Window
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        if firstList.isEmpty || B.isEmpty { return [] }
        var ans = [[Int]]()
        var i = 0
        var j = 0
        while i < firstList.count, j < secondList.count {
            let low = max(firstList[i][0], secondList[j][0])
            let high = min(firstList[i][1], secondList[j][1])
            if low <= high {
                ans.append([low, high])
            }
            if secondList[j][1] < firstList[i][1] {
                j += 1
            }else {
                i += 1
            }
        }


        return ans
    }
}
