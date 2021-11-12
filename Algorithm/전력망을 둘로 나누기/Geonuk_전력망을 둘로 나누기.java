import java.util.*;

class Solution {
    ArrayList<Integer>[] g;
    public int solution(int n, int[][] wires) {
        int answer = Integer.MAX_VALUE;
        
        g = new ArrayList[n + 1];
        
        for(int i = 1 ; i <= n ; ++i) g[i] = new ArrayList<>();
        
        for(int i = 0 ; i < n - 1 ; ++i){
            int[] tmp = wires[i];
            g[tmp[0]].add(tmp[1]);
            g[tmp[1]].add(tmp[0]);
        }
        
        for(int i = 0 ; i < n - 1; ++i){
            int[] tmp = wires[i];
            
            int a = count(tmp[0], tmp[1], n);
            int b = count(tmp[1], tmp[0], n);
            
            answer = Math.min(answer, Math.abs(a-b));
        }
        
        return answer;
    }
    
    public int count(int root, int n, int m){
        boolean[] check = new boolean[m + 1];
        
        Queue<Integer> q = new LinkedList<>();
        q.add(root);
        check[root] = true;
        
        int cnt = 0;
        while(!q.isEmpty()){
            int i = q.poll();
            cnt++;
            for(int val : g[i]){
                if(val == n || check[val]) continue;
                q.add(val);
                check[val] = true;
            }
        }
        
        return cnt;
    }
}
