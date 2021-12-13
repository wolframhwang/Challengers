// 21 12 13 solved by Wolfram Hwang
// 엣..토...그냥 품

class Solution {
    func maxPower(_ s: String) -> Int {
        var answer = 0
        var ret = 0
        var before : Character? = nil
        for c in s {
            if before == nil {
                before = c
                answer += 1
            }else {
                if before! == c {
                    answer += 1
                }else {
                    before = c
                    answer = 1
                }
            }
            if answer > ret {
                ret = answer
            }
        }
       
        return ret
    }
}
