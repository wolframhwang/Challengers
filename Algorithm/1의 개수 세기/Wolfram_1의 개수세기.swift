// 22.02.07 solved by Wolfram Hwang
// Using DP
// 생각해보단 쉬운 것이,
// ㅇㅇㅇㅇㅇ <- 같은 비트가 있을 경우, 비트에서 1의 개수 세는것은 최 고 자리의 비트 개수 대비 항상 /2 만큼 낮아서.. 이부분을 잘활용하면 쉬운문제가 됩니다.

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}

var dp: [Int] = [Int](repeating: 0, count: 64)

func initialization() {
    dp[0] = 1
    for i in 1..<55 {
        dp[i] = dp[i - 1] * 2 + (1 << i)
    }
}

func go(_ x: Int) ->Int {
    var index = 55
    var ans = x & 1
    var X = x
    for i in (1..<index).reversed() {
        if X & (1 << i) != 0 {
            ans += dp[i - 1] + (X - (1 << i) + 1)
            X -= (1 << i)
        }
    }
    return ans
 
}
initialization()
print(go(NM[1]) - go(NM[0] - 1))
