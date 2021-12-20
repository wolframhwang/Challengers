// 21 12 20 Solved by Wolfram Hwang
// using STACK

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
	var stk: [TreeNode?] = []
	var stkPointer = 0
	func findNode(_ node: TreeNode?) {
		stk.append(node)
		if node?.left != nil {
			findNode(node?.left)
		}
		stkPointer += 1
		if node?.right != nil {
			findNode(node?.right)
		}
	}

    func flatten(_ root: TreeNode?) {
		findNode(root)	
		for i in 0..<stk.count - 1 {
			//print(stk[i]?.val)
			stk[i]?.right = stk[i + 1]
			stk[i]?.left = nil
		}
    }
}
