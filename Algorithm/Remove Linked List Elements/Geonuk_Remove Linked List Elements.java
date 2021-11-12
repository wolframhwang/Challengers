class Solution {
    public ListNode removeElements(ListNode head, int val) {
        if(head == null) return head;
        
        ListNode answer = new ListNode(0);
        ListNode cur = head;
        ListNode res = answer;
        
        while(cur != null){
            if(cur.val == val) cur = cur.next;
            else {
                res.next = cur;
                res = cur;
                cur = cur.next;
            }
            
        }
        res.next = cur;
        return answer.next;
    }
}
