    def rob(self, root: Optional[TreeNode]) -> int:
        def rob_tree(root):
            if root == None: return [0,0]
            left = rob_tree(root.left)
            right = rob_tree(root.right)
            return [max([left[i] + right[j] for i in range(2) for j in range(2)]), root.val + left[0] + right[0]]
        
        return max(rob_tree(root))
