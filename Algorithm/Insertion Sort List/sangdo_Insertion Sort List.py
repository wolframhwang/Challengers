class Solution:
    def insertionSortList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        h = ListNode(val = -10000, next=head)
        prev = h
        cur = h.next
        
        while cur:
            nxt = cur.next
            now = h
            
            while now.next and now.next.val < cur.val:
                now = now.next
            prev.next = cur.next
            cur.next = now.next
            now.next = cur
            
            cur = nxt
            if prev.next != cur : prev= prev.next
            
            
            now = h.next
        return h.next
