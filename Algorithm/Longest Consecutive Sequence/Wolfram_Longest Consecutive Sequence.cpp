// 22 01 12 solved by Wolfram Hwang
// Using Union Find 
class Solution {
public:
    unordered_map<int, int> parent;
    unordered_map<int, bool> isThat;
    int getParent(int a) {
        if (a == parent[a]) { return a; }
        return parent[a] = getParent(parent[a]);
    }
    void unionParent(int a, int b) {
        int A = getParent(a);
        int B = getParent(b);
        if (A < B) {
            parent[b] = A;
        }else { parent[a] = B;}
    }
    int longestConsecutive(vector<int>& nums) {
        for (int i = 0; i < nums.size(); i++) {
            if (isThat[nums[i]] == false) { parent[nums[i]] = nums[i], isThat[nums[i]] = true;}
            if (isThat[nums[i] - 1]) { unionParent(nums[i], nums[i] - 1); }
            if (isThat[nums[i] + 1]) { unionParent(nums[i], nums[i] + 1); }
        }
        int answer = 0;
        for (int i = 0; i < nums.size(); i++) {
            int p = getParent(nums[i]);
            if (answer < nums[i] - p + 1)
                answer = nums[i] - p + 1;
        }
        return answer;
    }
};
