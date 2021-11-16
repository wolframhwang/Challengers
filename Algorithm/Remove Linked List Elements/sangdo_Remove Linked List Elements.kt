/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun removeElements(head: ListNode?, `val`: Int): ListNode? {
        var h = ListNode(0)
        h.next = head
        var prev: ListNode? = h
        var cur:ListNode? = h.next
        while(cur != null) {
            var next = cur
            if(cur.`val` == `val`) {
                prev!!.next = cur!!.next
                next = prev
            }
            prev = next
            cur = cur.next
        }
        return h.next
    }
}
