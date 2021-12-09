// 211209 solved Wolfram Hwang
// 까다로움

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
    func tilt(_ node: TreeNode?) -> (sum: Int, tilt: Int) {
		guard let node = node else { return (0, 0) }
        let (leftSum, leftTilt) = tilt(node.left)
	    let (rightSum, rightTilt) = tilt(node.right)
	    return (
		    leftSum + rightSum + node.val, 
			leftTilt + rightTilt + abs(leftSum - rightSum)
		)
	}
    
    func findTilt(_ root: TreeNode?) -> Int {
        	    

	    return tilt(root).tilt
    }
}
