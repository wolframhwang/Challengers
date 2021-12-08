import java.util.*;

class Solution {
    public long solution(int n, int m, int x, int y, int[][] queries) {
        
        int x1 = x;
        int x2 = x;
        int y1 = y;
        int y2 = y;
        
        for(int i = queries.length - 1 ; i >= 0 ; i--){
            
            //System.out.println("i : " + i  + " // x1 : " + x1 + " y1 : " + y1 + " x2 : " + x2 + " y2 : " + y2);
            //System.out.println("Query : " + Arrays.toString(queries[i]));
            if(queries[i][0] == 2) { // 위로 이동 -> 아래 x1 이동
                if(x1 != 0) x1 += queries[i][1];
                x2 = x2 + queries[i][1] < n - 1 ? x2 + queries[i][1] : n - 1;
                if(n < x1) return 0L;  
                
            } else if (queries[i][0] == 3) { // 아래로 이동 -> 위
                if(x2 != n - 1) x2 -= queries[i][1];
                x1 = x1 - queries[i][1] > 0 ? x1 - queries[i][1] : 0;
                if(x2 < 0) return 0L;
                
            } else if (queries[i][0] == 0) { // 왼쪽 이동 -> 오른쪽
                if(y1 != 0) y1 += queries[i][1];
                y2 = y2 + queries[i][1] < m - 1 ? y2 + queries[i][1] : m - 1;
                if(m < y1) return 0L;
                
            } else if (queries[i][0] == 1) { // 오른쪽 이동 -> 왼쪽
                if(y2 != m - 1) y2 -= queries[i][1];
                y1 = y1 - queries[i][1] > 0 ? y1 - queries[i][1] : 0;
                if(y2 < 0) return 0L;
            }
            //System.out.println("res : // x1 : " + x1 + " y1 : " + y1 + " x2 : " + x2 + " y2 : " + y2);
        }
        
        long a = x2 - x1 + 1;
        long b = y2 - y1 + 1;
        
        return a*b;
    }
}
