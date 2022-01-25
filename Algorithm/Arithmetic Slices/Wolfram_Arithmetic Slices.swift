class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count < 3 { return 0 }
        var answer = 0
        var len = 0
        var index = 2
        while index < nums.count {
            if nums[index - 1] - nums[index - 2] == nums[index] - nums[index - 1] {
                var now = 0
                while nums[index - 1] - nums[index - 2] == nums[index] - nums[index - 1] {
                    index += 1
                    now = now + 1
                    answer += now
                    if index >= nums.count { break }
                }
            }
            else { index += 1 }
        }
        return answer
    }
}
