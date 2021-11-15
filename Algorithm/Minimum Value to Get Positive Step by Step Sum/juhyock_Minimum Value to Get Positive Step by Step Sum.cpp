class Solution {
public:
    int minStartValue(vector<int>& nums) {
        
        int sum = 0, min = 1;
        
        for(int i = 0; i < nums.size(); i++){
            sum += nums[i];
            
            if(min > sum)
                min = sum;
        }
        
        if(min <= 0)
            return abs(min) + 1;
        else
            return abs(min);
    }
};