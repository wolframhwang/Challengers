/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    int res = 0;
    public int sumEvenGrandparent(TreeNode root) {
        rec(root);
        return res;
    }
    
    public void rec(TreeNode root){
        if(root == null) return;
        
        if(root.val%2 == 0){
            if(root.left != null){
                if(root.left.left != null) res += root.left.left.val;
                if(root.left.right != null) res += root.left.right.val;
            }
            
            if(root.right != null){
                if(root.right.left != null) res += root.right.left.val;
                if(root.right.right != null) res += root.right.right.val;
            }
        }
        
        rec(root.left);
        rec(root.right);
    }
}
