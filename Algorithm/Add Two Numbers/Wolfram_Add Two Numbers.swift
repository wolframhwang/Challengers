// 21 01 19 solved by Wolfram Hwang
// Linked List Problem
// 
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let ret: ListNode? = l1
		var carry = 0
		var ll1 = l1
		var ll2 = l2
		var prev: ListNode? = nil
		while true {
			if ll1 != nil, ll2 != nil {
				ll1?.val = (ll1?.val ?? 0) + (ll2?.val ?? 0) + carry
				carry = 0
				if (ll1?.val ?? 0) >= 10 {
					carry = 1
					ll1?.val %= 10
				}
				prev = ll1
				ll1 = ll1?.next
				ll2 = ll2?.next
			}
			else if ll1 == nil, ll2 != nil {
				ll2?.val = (ll2?.val ?? 0) + carry
				carry = 0
				if (ll2?.val ?? 0) >= 10 {
					carry = 1
					ll2?.val %= 10
				}
                prev?.next = ll2			
				ll1 = ll2
				ll2 = nil
				prev = ll1
				ll1 = ll1?.next
			}else if ll1 != nil, ll2 == nil {
				ll1?.val = (ll1?.val ?? 0) + carry
				carry = 0
				if ll1?.val ?? 0 >= 10 { carry = 1
					ll1?.val %= 10
				}
				prev = ll1
				ll1 = ll1?.next
			}else {break }
		}
		if carry == 1 {
			prev?.next = ListNode(1)
		}
		return ret
    }
}
