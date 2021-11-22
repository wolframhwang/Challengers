class Solution:
    def deleteThis(self, root):
        ret = root.right
        if ret == None: return root.left
        if ret.left:
            prev = root
            while ret.left:
                prev = ret
                ret = ret.left
            prev.left = ret.right
            ret.right = root.right
        ret.left = root.left
        return ret
        
    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        if not root: return None
        if root.val > key:
            root.left = self.deleteNode(root.left, key)
        elif root.val < key:
            root.right = self.deleteNode(root.right, key)
        else:
            return self.deleteThis(root)
        return root
