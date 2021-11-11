class Solution {
    fun minStartValue(nums: IntArray): Int {
        var s = 0
        var mmin = 0x3f3f3f3f
        nums.forEach{
            s += it
            mmin = Math.min(mmin, s)
        }
        print(mmin)
        return -Math.min(-1, mmin -1)
    }
}
