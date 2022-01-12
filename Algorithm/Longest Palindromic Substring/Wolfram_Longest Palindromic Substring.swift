// 22 01 12 solved by Wolftam Hwang

/*
Given a string s, return the longest palindromic substring in s.

 Example 1:

Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.
Example 2:

Input: s = "cbbd"
Output: "bb"
*/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var r = 0
		var p = 0
		var arr: [Character] = ["#"]

		for c in s {
			arr.append(c)
			arr.append("#")
		}
		var A : [Int] = [Int](repeating: 0, count: arr.count)
		var pos = 0
		var maxRight = 0
		var maxLen = 0
		var maxLenPos = 0
		let len = arr.count
		for i in 0..<arr.count {
			if i < maxRight {
				A[i] = min(A[2 * pos - i], maxRight - i)
			}else {
				A[i] = 1
			}

			while i - A[i] >= 0, i + A[i] < len, arr[i + A[i]] == arr[i - A[i]] {
				A[i] += 1
			}
			if A[i] > maxLen {
				maxLen = A[i]
				maxLenPos = i
			}
			if i + A[i] > maxRight {
				maxRight = i + A[i]
				pos = i
			}
		}
		var ret: String = ""
		for i in (maxLenPos - maxLen + 1)..<(maxLenPos + maxLen - 1) {
			if arr[i] != "#" {
				ret += String(arr[i])
			}
		}
		return ret
    }
}
