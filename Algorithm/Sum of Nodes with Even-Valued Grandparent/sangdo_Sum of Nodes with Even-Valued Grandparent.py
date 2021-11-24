class Solution:
    def sumEvenGrandparent(self, root: TreeNode, parent = 1, grandParent = 1) -> int:
        if not root: 
            return 0
        
        return self.sumEvenGrandparent(root.left, root.val, parent) + self.sumEvenGrandparent(root.right, root.val, parent) + (root.val if grandParent%2 == 0 else 0)
