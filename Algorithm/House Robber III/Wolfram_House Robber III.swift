// 211206 solved by Wolfram Hwang
// Tree DP 
// 공간복잡도 저 줄여볼순 있을거같은데.. 귀찮..
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
 class Node {
     public var val1: Int
     public var val2: Int
     public var left: Node?
     public var right: Node?
     public init(_ val1: Int, _ val2: Int) { self.val1 = val1; self.val2 = val2; self.left = nil; self.right = nil; }
 }
class Solution {
    func go(_ node: TreeNode?, _ now: Node?) {
        guard let value = node?.val else {
            return
        }
        var nd = now     
        if node?.left != nil {
            var l = Node(0, 0)
            nd?.left = l
            go(node?.left, l)
        }
        if node?.right != nil {
            var r = Node(0, 0)
            nd?.right = r
            go(node?.right, r)
        }
        if node?.left == nil, node?.right == nil {
            nd?.val1 = node?.val ?? 0
        }
        nd?.val1 = (nd?.left?.val2 ?? 0) + (nd?.right?.val2 ?? 0) + (node?.val ?? 0)
        nd?.val2 = max((nd?.left?.val1 ?? 0), (nd?.left?.val2 ?? 0))  + 
        max((nd?.right?.val1 ?? 0), (nd?.right?.val2 ?? 0))
    }
    func rob(_ root: TreeNode?) -> Int {
        var node: Node? = Node(0, 0)
        go(root, node)
        return max(node?.val1 ?? 0, node?.val2 ?? 0)
    }
}
