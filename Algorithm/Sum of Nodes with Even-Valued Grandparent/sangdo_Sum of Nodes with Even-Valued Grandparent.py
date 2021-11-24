class Solution:
    def sumEvenGrandparent(self, root: TreeNode, parent = 1, grandParent = 1) -> int:
        ret = 0
        if not root: 
            return 0
        if grandParent % 2 == 0: 
            ret += root.val
        
        return ret + self.sumEvenGrandparent(root.left, root.val, parent) + self.sumEvenGrandparent(root.right, root.val, parent)
