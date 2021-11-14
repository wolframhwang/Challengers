// 211114 solved by Wolfram Hwang
// 순열, 조합 문제 -> init 시 만들어줘서 인덱싱 넘기는것으로 문제 해결
class CombinationIterator {
    var comb = [String]()
    var index = -1
    
    init(_ characters: String, _ combinationLength: Int) {
        var arr : [String] = [""]
        for c in characters {
            for v in arr {
                let newStr = v + String(c)
                arr.append(newStr)
                if newStr.count == combinationLength {
                    comb.append(newStr)
                }
            }
        }
        comb = comb.sorted()
    }
    
    func next() -> String {
        if index < comb.count {
            index += 1
            return comb[index]
        }else {
            return ""
        }
    }
    
    func hasNext() -> Bool {
        return index < comb.count - 1
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
