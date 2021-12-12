class Solution:
    def __init__(self):
        self.sum = dict()
        self.sum[None] = 0
        
    def findTilt(self, root: Optional[TreeNode]) -> int:
        if root == None: return 0
        left, right = self.findTilt(root.left), self.findTilt(root.right)
        self.sum[root] = self.sum[root.left] + self.sum[root.right] + root.val
        return left + right + abs(self.sum[root.left] - self.sum[root.right])
