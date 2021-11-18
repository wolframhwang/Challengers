class Solution:
    def largestDivisibleSubset(self, nums: List[int]) -> List[int]:
        
        if not nums:
            return []
        
        dp = [[]]
        for n in sorted(nums):
            dp.append([n] + max((i for i in dp if not i or n % i[0] == 0), key = len))
            
        return max(dp, key = len)