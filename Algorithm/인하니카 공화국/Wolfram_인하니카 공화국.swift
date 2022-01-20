// 220120 solved by Wolfram Hwang
// Using DP
// 매우 간단함
var map : [[(Int, Int)]] = []
let INF = 987654321
var dp: [Int] = []
var visit: [Bool] = []
let T = Int(readLine()!)!
var NM : [Int] = []

func go(_ info: (Int, Int)) -> Int {
	if dp[info.0] != INF { return dp[info.0]}
	if map[info.0].count == 1, info.0 != 1 {
		dp[info.0] = info.1
		return info.1
	}
	var total = 0
	for i in 0..<map[info.0].count {
		let next: (Int, Int) = map[info.0][i]
		if visit[next.0] { continue }
		visit[next.0] = true
		total += go(next)
	}
	dp[info.0] = min(total, info.1)
	return dp[info.0]
}

func input() {
	NM = readLine()!.split(separator: " ").map{Int(String($0))!}
	map = [[(Int, Int)]](repeating: [(Int, Int)](), count: NM[0] + 1)
	dp = [Int](repeating: INF, count: NM[0] + 1)
	visit = [Bool](repeating: false, count: NM[0] + 1)
	for _ in 0..<NM[1] {
		let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
		map[abc[0]].append((abc[1], abc[2]))
		map[abc[1]].append((abc[0], abc[2]))
	}
	
}

for _ in 0..<T {
	input()	
	visit[1] = true
	go((1, INF))
	print(dp[1])
}
