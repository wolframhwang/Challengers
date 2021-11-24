// 211124 solved by Wolfram Hwang

class Solution {
    let exclu = 3
    func recur(_ node: TreeNode?, _ bit: Int)-> Int {
        var ret = 0
        if bit & 2 == 2 {
            //print(node?.val)
            ret = node?.val ?? 0
        }
        let v = node?.val ?? 0
        var nextbit = bit << 1
        if v % 2 == 0 {
            nextbit = nextbit & exclu
            nextbit += 1
        }

        if node?.left != nil {
            ret += recur(node?.left, nextbit)
        }
        if node?.right != nil {
            ret += recur(node?.right, nextbit)
        }
        return ret
    }
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        if root == nil 
        {
            return 0
        }

        return recur(root, 0)
    }
}
