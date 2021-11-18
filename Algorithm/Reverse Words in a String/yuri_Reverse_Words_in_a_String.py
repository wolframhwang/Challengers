class Solution:
    def reverseWords(self, s: str) -> str:
        
        s.strip()
        split = s.split()
        reverse = list(reversed(split))
        
        return ' '.join(reverse)