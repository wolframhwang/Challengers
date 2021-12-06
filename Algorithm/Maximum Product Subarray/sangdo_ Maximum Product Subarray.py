class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        res = -0x80000000
        mul,mul2 = 1,1
        
        for a,b in zip(nums, nums[::-1]):
            mul *= a
            mul2 *= b
            res = max(res, mul, mul2)
            mul = 1 if mul == 0 else mul
            mul2 = 1 if mul2 == 0 else mul2
            
        return res
