// 21 01 26 solved By Wolfram Hwang
// Using State Checker

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 3 { return false }
        var state: Int = 0
        
        for i in 1..<arr.count {
            if arr[i] - arr[i - 1] > 0 {
                if state == 0 || state == 1 {
                    state = 1
                }else {
                    return false
                }
            }else if arr[i] - arr[i - 1] < 0 {
                if state == 1 || state == 2 {
                    state = 2
                }else { return false }
            }else { return false }
        }
        if state < 2 { return false }
        return true
    }
}
