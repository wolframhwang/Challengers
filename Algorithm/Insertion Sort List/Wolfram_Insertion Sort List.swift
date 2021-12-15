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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        let lead = ListNode(Int.min)
        lead.next = head

        var end = head
        while let p = end.next {
            if p.val < end.val {
                var prev = lead
				var cur = lead.next
                while cur!.val <= p.val {
                    prev = cur!
                    cur = cur!.next
                }
                end.next = p.next
                prev.next = p
                p.next = cur
            } else {
                end = p
            }
        }
        
        return lead.next
    }
}
