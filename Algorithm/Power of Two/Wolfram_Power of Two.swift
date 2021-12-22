// 21 12 22 solved by Wolfram Hwang
// Short Code!
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n != 0 && n & (n - 1) == 0
    }
}
