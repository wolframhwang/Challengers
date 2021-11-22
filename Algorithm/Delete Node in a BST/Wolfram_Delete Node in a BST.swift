// 211122 solved by wolfram Hwang
// using DFS

class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
                let minNode = find(root.right!)
                root.val = minNode.val
                root.right = deleteNode(root.right, root.val)
            }
        }        
        return root
    }
    
    func find(_ node: TreeNode) -> TreeNode {
        var node = node        
        while let leftNode = node.left {
            node = leftNode
        }        
        return node
    }
}
