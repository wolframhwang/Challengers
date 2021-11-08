class Solution {
    lateinit var dp: IntArray
    var n = 0
    fun getNum(b:Int): Int {
        var bit = b
        bit = (bit.and(0x55555555) + (bit.shr(1).and(0x55555555)))
        bit = (bit.and(0x33333333) + bit.shr(2).and(0x33333333))
        bit = bit.and(0x0f0f0f0f) + bit.shr(4).and(0x0f0f0f0f)
        bit = bit.and(0x00ff00ff) + bit.shr(8).and(0x00ff00ff)
        return bit.and(0x0000ffff) + bit.shr(16).and(0x0000ffff)
    }
    fun dfs(bit: Int): Int {
        if(bit == 0) return 1
        if(dp[bit] != -1) return dp[bit]
        dp[bit]  = 0
        for(i in 0 until n) {
            if(1.shl(i).and(bit) != 0) {
                var left = bit.shr(i+1).shl(i+1)
                var right = bit.and(1.shl(i)-1)
                dp[bit] += dfs(left) * dfs(right)
            }
        }
        return dp[bit]
    }
    fun numTrees(N: Int): Int {
        n = N
        dp = IntArray(1.shl(n)){-1}
        return dfs(1.shl(n)-1)
    }
}
