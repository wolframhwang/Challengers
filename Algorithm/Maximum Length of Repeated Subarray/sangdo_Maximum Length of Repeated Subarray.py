class Solution:
    def findLength(self, nums1: List[int], nums2: List[int]) -> int:
        res = 0
        l = [1] * len(nums2)
        adj = [[] for _ in range(101)]
        for i in range(len(nums2)-1, -1, -1):
            v = nums2[i]
            adj[v].append(i)
            
        indices = [-900]* len(nums2)
        for i,c in enumerate(nums1):
            for j in adj[c]:
                if j > 0 and indices[j-1] == i-1:
                    l[j] = l[j-1] + 1
                else:
                    l[j] = 1
                indices[j] = i
                res = max(res, l[j])
        return res
        
        
