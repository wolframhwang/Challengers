// 21 12 21 solved by wolfram Hwang
// use segment tree

class NumArray {
	var tree: [Int] = []
	var arr: [Int] = []
    init(_ nums: [Int]) {
        arr = nums
		tree = [Int](repeating: 0, count: (arr.count << 2))
		initTree(0, arr.count - 1, 1)
    }
    
    func update(_ index: Int, _ val: Int) {
        segUpdate(0, arr.count - 1, 1, index, val)
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {

        return segSum(0, arr.count - 1, 1, left, right)
    }

	func initTree(_ start: Int, _ end: Int, _ node: Int) -> Int{
		if start == end { 
            tree[node] = arr[start]
		    return tree[node]
        }
		let mid = (start + end) / 2
		tree[node] = initTree(start, mid, node * 2) + initTree(mid + 1, end, node * 2 + 1)
		return tree[node]
	}

	func segSum(_ start: Int, _ end: Int, _ node: Int, _ left: Int, _ right: Int) -> Int {
		if left > end || right < start { return 0}
		if left <= start, end <= right { return tree[node]}
		let mid = (start + end) / 2
		let ret = segSum(start, mid, node * 2 , left, right) + segSum(mid + 1, end, node * 2 + 1, left, right)
		return ret
	}

	func segUpdate(_ start: Int, _ end: Int, _ node: Int, _ idx: Int, _ diff: Int) {
		if start == end {
			arr[idx] = diff
			tree[node] = diff
			return
		}

		let mid = (start + end) / 2
		if idx > mid {
			segUpdate(mid + 1, end, 2 * node + 1, idx, diff)
		}else {
			segUpdate(start, mid, 2 * node, idx , diff)
		}
		tree[node] = tree[node * 2] + tree[node * 2 + 1]
	}
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */
