// 211112 solved by Wolfram Hwang
// Using Single Linked List + adding Base Node

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var v : ListNode? = ListNode(0, head)
        var ret = v
        while v != nil {
            if v?.next?.val == val {
                v?.next = v?.next?.next
                continue
            }
            if v?.next == nil {
                break
            } 
            v = v?.next
        }
        return ret?.next
    }
}
