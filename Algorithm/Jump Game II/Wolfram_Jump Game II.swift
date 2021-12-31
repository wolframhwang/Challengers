// 21 12 29 solved by Wolfram Hwang
// Using DP!!

class Solution {
    func jump(_ nums: [Int]) -> Int { 
		var size = nums.count
		var currentMAX = 0
		var currentREACH = 0
		var JUMP = 0
		for i in 0..<(size - 1) {
			if i + nums[i] > currentMAX {
				currentMAX = i + nums[i]
			}

			if i == currentREACH {
				JUMP += 1
				currentREACH = currentMAX
			}
		}

		return JUMP
  	}
}
