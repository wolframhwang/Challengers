// 211129 solved by Wolfram Hwang
// using Union Find

class Solution {
    var parent: [Int: Int] = [:]
    func find(_ i: Int) -> Int {
        var i = i
        while i != parent[i] {
            i = parent[i]!
        }
        return i
    }
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {                
        for i in 0..<accounts.count {
            parent[i] = i
        }
                        
        var emailToIndex: [String: Int] = [:]

        for (i, account) in accounts.enumerated() {
            let name = account[0]

            for j in 1..<account.count {
                let email = account[j]
                if let idx = emailToIndex[email] {
                    parent[find(i)] = find(idx)
                } else {
                    emailToIndex[email] = i
                }
            }
        }
        
        var merged: [Int: [String]] = [:]
        
        for email in emailToIndex.keys {
            let Index = find(emailToIndex[email]!)
            if merged[Index] == nil {
                merged[Index] = []
            }
            merged[Index]?.append(email)
        }
        
        var res: [[String]] = []
        for (i, emails) in merged {
            var emails = emails
            emails.sort()
            res.append([accounts[i][0]] + emails)
        }
        
        return res
    }
}
