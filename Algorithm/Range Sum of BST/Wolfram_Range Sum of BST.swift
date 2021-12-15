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
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var ret = 0
        var left = 0
        var right = 0
        let val = root?.val ?? 0
        if val >= low, val <= high {
            ret += val
        }
        
        if root?.left != nil {
            left = rangeSumBST(root?.left, low, high)
        }
        if root?.right != nil {
            right = rangeSumBST(root?.right, low, high)
        }
        return left + right + ret
    }
}
