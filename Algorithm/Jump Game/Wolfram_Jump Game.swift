// 21 12 28 solved by Wolfram
// use DP by flow from up to down
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
		var dist = 0
        for i in (0..<nums.count).reversed() {
			if nums[i] >= dist {
				dist = 1
			}else {
				dist += 1
			}			
		}
		return dist == 1
			
    }
}
