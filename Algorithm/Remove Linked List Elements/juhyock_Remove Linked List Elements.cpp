class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        
        if(head == nullptr)
            return head;
        
        ListNode* prev = head;
        ListNode* start = head->next;
        
        while(start != nullptr){
            if(start->val == val){
                start = start->next;
                prev->next = start;
            }
            else{
                start = start->next;
                prev = prev->next;
            }
        }
        
        if(head->val == val)
            return head->next;
        
        return head;
    }
};