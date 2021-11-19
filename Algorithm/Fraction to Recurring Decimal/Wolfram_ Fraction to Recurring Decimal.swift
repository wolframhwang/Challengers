class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 { return "0"}
        var dp: [Int: Int] = [:]
        var numb = abs(numerator)
        var deco = abs(denominator)
        
        var answer = ""
        var frac: Bool = false
        var last: Int = 0
        var is_positive: Bool = ((numerator > 0 && denominator > 0) || (numerator < 0 && denominator < 0)) ? true: false;
        if numb >= deco {
            answer += String(numb / deco)
            numb %= deco
        }
        else {
            answer += "0"
        }

        if numb == 0 {
            return is_positive ? answer : "-" + answer
        }else{
            answer += "."
            dp[numb] = answer.count
        }

        while numb > 0 {
            numb *= 10
            if numb >= deco {
                answer += String(numb / deco)
                numb %= deco
            }else {
                while numb >= deco {
                    answer += "0"
                    numb *= 10
                }
                answer += String(numb / deco)
                numb %= deco
            }

            if dp[numb] != nil {
                last = dp[numb]!
                break
            }
            dp[numb] = answer.count
        }
        var ranswer = ""
        var idx = 0
        for c in answer {
            if idx == dp[numb] {
                ranswer += "("
            }
            ranswer += String(c)
            idx += 1
        }
        if last != 0 {
            ranswer += ")"
        }
        return is_positive ? ranswer: "-" + ranswer 
    }
}
