// 22 01 07 solved by Wolfram Hwang
// DP 

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var now = 0
		var minp = -prices[0]
		for i in 1..<prices.count {
			now = max(now, minp + prices[i] - fee)
			minp = max(minp, now - prices[i])
		}
		return now
    }
}
