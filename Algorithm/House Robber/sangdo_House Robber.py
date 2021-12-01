class Solution:
    def rob(self, nums: List[int]) -> int:
        prev = 0
        pprev = 0
        for v in nums:
            pprev, prev = max(pprev, prev), max(prev, pprev+v)
        return max(pprev,prev)
