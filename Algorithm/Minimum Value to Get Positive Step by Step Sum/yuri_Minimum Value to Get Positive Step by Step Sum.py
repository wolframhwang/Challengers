class Solution: 
    def minStartValue(self, nums: List[int]) -> int: 
        answer = float('inf') 
        amount = 0 
        for i in nums: 
            amount += i 
            answer = min(answer,amount) 
        
        return 1 if answer >= 1 else abs(answer) + 1
