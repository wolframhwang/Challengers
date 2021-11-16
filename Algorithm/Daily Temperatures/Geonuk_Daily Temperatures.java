class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        Stack<Integer> stack = new Stack<>();
        int N = temperatures.length;
        
        int[] res = new int[N];
    
        for(int i = N - 1 ; i >= 0 ; i--){
            int temp = temperatures[i];
            
            if(stack.isEmpty()){
                stack.push(i);
                res[i] = 0;
            } else {
                if(temp < temperatures[stack.peek()]){
                    res[i] = stack.peek() - i;
                    stack.push(i);
                } else {
                    while(!stack.isEmpty() && temp >= temperatures[stack.peek()]){
                        stack.pop();
                    }
                    
                    if(stack.isEmpty()){
                        res[i] = 0;
                    } else {
                        res[i] = stack.peek() - i;
                    }
                    
                    stack.push(i);
                }
            }
        }
        
        return res;
    }
}
