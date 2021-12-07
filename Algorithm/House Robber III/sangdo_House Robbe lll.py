class Solution:
    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        h = ListNode(next=head)
        even = ListNode()
        cur = head
        pprev = cur
        while cur:
            pprev = cur
            if cur.next == None: break
            nxt = cur.next
            cur = nxt.next
            nxt.next = even.next
            even.next = nxt
            pprev.next = cur
            
        cur = even.next
        while cur:
            nxt = cur.next
            cur.next = pprev.next
            pprev.next = cur
            cur = nxt
        return h.next
        
