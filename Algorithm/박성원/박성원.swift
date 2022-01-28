// 22 01 28 not solved by Wolfram Hwang
// 못풀겠어서 풀이를봤읍니다.. 넘모어렵네요;
// https://travelbeeee.tistory.com/445 <- 이분의 풀이를 봤어요
// 최대 길이가 50인 N개의 정수를 뽑는 경우가 N 팩토리얼개만큼이라.. 완전탐색은 처음부터 불가능합니다.
// -> DP, Greedy 로 풀어야 한다는 건데, Greedy 로 풀만한 조건을 못찾겠었어요. 그리고, 작은, 어떤 정수를 뽑았는지에 따라 작은문제로 -> 큰문제를 푸는게 가능한것 같아서..
// DP라고 어림 짐작은했는데 도저히 생각이안났습니다.

let n = Int(readLine()!)!
var num:[String] = []
var modnum:[Int] = []
var len:[Int] = []
var ten = Array(repeating: 1, count: 51)
var fact:[Int] = Array(repeating: 1, count: 16)
for _ in 1...n {
    let tmp = readLine()!
    len.append(tmp.count)
    num.append(tmp)
}
let k = Int(readLine()!)!
for i in 1...50 {
    ten[i] = (ten[i-1]*10) % k
}
for i in 1...15 {
    fact[i] = fact[i-1] * i
}
for i in 0..<n {
    var tmp = 0
    for c in num[i] {
        tmp = (tmp*10 + Int(String(c))!) % k
    }
    modnum.append(tmp)
}
var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: k), count: (1<<n))
dp[0][0] = 1

for i in 0..<(1<<n) {
    for j in 0..<k {
        if dp[i][j] == 0 {
            continue
        }
        for idx in 0..<n {
            if (i & (1<<idx)) == 0 {
                let next = ((j*ten[len[idx]])%k + modnum[idx]) % k
                dp[i|(1<<idx)][next] += dp[i][j]
            }
        }
    }
}

let gcdVal = gcd(a: dp[(1<<n)-1][0], b: fact[n])
print("\(dp[(1<<n)-1][0]/gcdVal)/\(fact[n]/gcdVal)")

func gcd(a: Int, b: Int) -> Int {
    return b == 0 ? a : gcd(a:b, b:a % b)
}
