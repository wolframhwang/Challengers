// 22 01 27 solved by Wolfram Hwang
// 풀긴 풀었는데, Element 의 수가 많아지면 과연 이방법으로 될까? 라는 생각
// 좀 더 줄이는 방법은 없을까?
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
    var stk: [[Int]] = [[Int]](repeating: [Int](), count: 2)
    func findSeq(_ node: TreeNode?, _ idx: Int) {
        if node?.left != nil {
            findSeq(node?.left, idx )
        }
        guard let val = node?.val else { return }
        stk[idx].append(val)
        if node?.right != nil {
            findSeq(node?.right, idx)
        }
    }
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        findSeq(root1, 0)
        findSeq(root2, 1)
        var sp1 = 0
        var sp2 = 0
        var answer: [Int] = []
        while sp1 < stk[0].count && sp2 < stk[1].count {
            if stk[0][sp1] <= stk[1][sp2] {
                answer.append(stk[0][sp1])
                sp1 += 1
            }
            else {
                answer.append(stk[1][sp2])
                sp2 += 1
            }
        }
        while sp1 < stk[0].count {
            answer.append(stk[0][sp1])
            sp1 += 1
        }
        while sp2 < stk[1].count {
            answer.append(stk[1][sp2])
            sp2 += 1
        }
        return answer
    }
}
