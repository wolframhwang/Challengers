class Solution:
    def maxPower(self, s: str) -> int:
        l = 1
        res = 1
        for i in range(1,len(s)):
            if s[i] == s[i-1]:
                l+=1
                res = max(l, res)
            else:
                l = 1
        return res
