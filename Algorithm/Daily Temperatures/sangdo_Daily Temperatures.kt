class Solution {
    fun dailyTemperatures(temperatures: IntArray): IntArray {
        var pq = PriorityQueue<Int>{i,j -> temperatures[i]-temperatures[j]}
        var res = IntArray(temperatures.size)
        temperatures.forEachIndexed {
            i,v->
            while(pq.isNotEmpty() && temperatures[pq.peek()] < v) {
                var prev = pq.poll()
                res[prev] = i-prev
            }
            pq.add(i)
        }
        
        return res
    }
}
