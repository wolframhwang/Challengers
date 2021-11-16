import java.util.*
class Solution {
    fun solution(n: Int, m: Int, x: Int, y: Int, queries: Array<IntArray>): Long {
        //좌우상하
        var comp = intArrayOf(0, m, 0, n)
        var reverse = intArrayOf(1, -1, 1, -1)
        var limit = intArrayOf(m,m,n,n);
        //0,1,2,3
        //1,0,3,2
        //l,r,u,d
        var value = intArrayOf(y,y+1,x,x+1)
        var answer: Long = -1
        for(i in queries.lastIndex downTo 0) {
            var c = queries[i][0]
            var dx = queries[i][1]
            value[c.xor(1)] += reverse[c] * dx
            //벽에 붙어있다.
            if(comp[c] != value[c]) {
                value[c] += reverse[c]* dx   
                value[c] = Math.min(value[c], limit[c])
                value[c] = Math.max(value[c], 0)
            }
            value[c.xor(1)] = Math.min(value[c.xor(1)], limit[c.xor(1)])
            value[c.xor(1)] = Math.max(value[c.xor(1)], 0)
            //println("${value[0]} ${value[1]} ${value[2]} ${value[3]}")
            if(value[0] == m || value[2] == n || value[1] == 0 || value[3] == 0) return 0L
        }
        answer = (1L*value[1]-value[0])*(1L*value[3]-value[2])
     
        return answer
    }
}
