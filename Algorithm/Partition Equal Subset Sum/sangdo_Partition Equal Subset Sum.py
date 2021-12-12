class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        n = len(nums)
        s = sum(nums)
        if s % 2: return False
        s //= 2
        chk = set()
        now = [0]
        for i in range(n):
            for k in range(len(now)-1, -1, -1):
                if nums[i] + now[k] == s: return True
                if (nums[i] + now[k]) not in chk:
                    chk.add(nums[i]+now[k])
                    now.append(nums[i]+now[k])
        return False
