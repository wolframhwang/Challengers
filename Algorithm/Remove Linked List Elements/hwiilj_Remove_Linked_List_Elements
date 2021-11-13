/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */


struct ListNode* removeElements(struct ListNode* head, int val){
    struct ListNode *cur, *prev;
    cur = head;
    while(cur){
        if(cur->val == val){
            if(cur==head)
                head = cur->next;
            else
                prev->next = cur->next;
        }
        else{
            prev = cur;
        }
        cur = cur->next;
    }
    return head;
}
