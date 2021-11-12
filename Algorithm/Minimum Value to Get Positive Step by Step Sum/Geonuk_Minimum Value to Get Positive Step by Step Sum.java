class Solution {
    public int minStartValue(int[] nums) {
        int sum = 0;
        int res = nums[0];
        for(int i = 0 ; i < nums.length ; ++i){
            sum += nums[i];
        
            if(sum < 0) res = Math.min(res, sum);
        }
        
        return res < 0 ? (res * -1) + 1 : 1;
    }
}
