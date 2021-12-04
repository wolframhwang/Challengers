
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var ret = head
        var node = head
        var even: ListNode? = nil
        var startEven: ListNode?
        var index = 0
        
        while true {
            if even == nil {
                even = node?.next
                startEven = even
            }else {
                even?.next = node?.next
                even = even?.next
            }
            node?.next = node?.next?.next
            if node?.next == nil {
                break
            }
            node = node?.next
        }
        node?.next = startEven
        return ret
    }
}
