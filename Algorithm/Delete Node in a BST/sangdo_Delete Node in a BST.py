class Solution:
    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        if not root: return None
        if root.val > key:
            root.left = self.deleteNode(root.left, key)
        elif root.val < key:
            root.right = self.deleteNode(root.right, key)
        else:
            if root.right == None: return root.left
            new_node = root.right
            while new_node.left:
                new_node = new_node.left
            new_node.right = self.deleteNode(root.right, new_node.val)
            new_node.left = root.left
            return new_node
        return root
