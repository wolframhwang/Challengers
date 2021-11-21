// 211122 solved by Wolfram Hwang
// 바이너리 트리, 그리고 중위순회의 컨셉트를 사용하면 쉽게 풀립니다.
class Solution {
    var orderMap: [Int: Int] = [:]
    var now: Int = 0
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        now = postorder.count - 1
        orderMap = [:]
        
        for (idx, val) in inorder.enumerated() {
            orderMap[val] = idx
        }
        
        return recur(postorder, 0, postorder.count - 1)
    }
    
    func recur(_ postorder: [Int], _ s: Int, _ e: Int) -> TreeNode? {
        if s > e || now < 0 {
            return nil
        }
        let v = postorder[now]
        let node = TreeNode(v)
        let index = orderMap[v] ?? 0
        
        now -= 1
        
        node.right = recur(postorder, index + 1, e)
        node.left = recur(postorder, s, index - 1)
        
        return node
    }
}
