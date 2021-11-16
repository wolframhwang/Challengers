class CombinationIterator(var characters: String, var combinationLength: Int) {
    var bit = 1.shl(combinationLength)-1
    var stringBuilder = StringBuilder()
    var pq = PriorityQueue<String>{i,j -> 
        when{
            i < j -> -1
            i > j -> 1
            else -> 0
        }
    }
    fun getLastZero(bit: Int):Int {
        for(i in 0 until 32) {
            if(1.shl(i).and(bit) != 0) return i
        }
        return 32
    }
    init{
        var sb = StringBuilder(characters)
        var pq2 = PriorityQueue<Char>{i,j -> i.toInt() - j.toInt()}
        sb.forEach{pq2.add(it)}
        while(pq2.isNotEmpty()){
            stringBuilder.append(pq2.poll())
        }
        while(bit < 1.shl(characters.length)) {
            var lastZero = getLastZero(bit)
            var lastOne = bit.and(-bit)
            var mask = bit+lastOne-1
            var left = mask + 1
            var leftMove = mask.inv().and(-mask.inv())
            var right = (leftMove-1).shr(lastZero+1)
            var res = ""
            for(i in IntRange(0, characters.length)) {
                if(1.shl(i).and(bit) != 0) {
                    res += stringBuilder[i]
                }
            }
            pq.add(res)
            bit = left + right
        }
    }
    fun next(): String {
        return pq.poll()
    }

    fun hasNext(): Boolean {
        return pq.isNotEmpty()
    }

}
