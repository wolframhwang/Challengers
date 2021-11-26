// 21 11 26 Solved by Wolfram Hwang
// Binary Search

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var s = 0
        var e = nums.count
        while s < e {
            let m = (s + e) / 2
            if nums[m] == target {
                return m
            }
            if nums[m] < target {
                s = m + 1
            }else {
                e = m
            }            
        }
        return s
    }
}
