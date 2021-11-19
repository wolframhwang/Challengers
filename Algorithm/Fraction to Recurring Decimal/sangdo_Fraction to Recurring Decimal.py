class Solution:
    def fractionToDecimal(self, numerator: int, denominator: int) -> str:
        dic = {}
        res = ''
        
        minus = '-' if numerator * denominator <  0.0 else ''
        numerator, denominator = map(abs, [numerator, denominator])
        share = numerator // denominator
        if numerator % denominator == 0: return minus + str(share)
        res = str(share) + '.'
        numerator = numerator % denominator * 10
        
        while numerator:
            share, remain = numerator // denominator, numerator % denominator
            if (share, remain) in dic:
                idx = dic[(share,remain)]
                return minus + res[:idx] + '(' + res[idx:] + ')'
            
            dic[share,remain] = len(res)
            res += str(share)
            numerator = remain*10
        return minus + res
