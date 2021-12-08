class Solution {
    public int[][] intervalIntersection(int[][] firstList, int[][] secondList) {
        int n1 = firstList.length;
        int n2 = secondList.length;
        
        int idx1 = 0;
        int idx2 = 0;
        
        int s = 0;
        int e = 1;
        
        ArrayList<int[]> list = new ArrayList<>();
        
        while(idx1 < n1 && idx2 < n2){
            if(firstList[idx1][e] < secondList[idx2][s]) idx1++;
            else if(firstList[idx1][s] > secondList[idx2][e]) idx2++;
            else {
                int a = Math.max(firstList[idx1][s], secondList[idx2][s]);
                int b = Math.min(firstList[idx1][e], secondList[idx2][e]);
                
                list.add(new int[] {a,b});
                if(firstList[idx1][e] < secondList[idx2][e]) idx1++;
                else idx2++;
            }
        }
        
        int[][] ans = new int[list.size()][2];
        
        int index = 0;
        for(int[] i : list){
            ans[index][0] = i[0];
            ans[index++][1] = i[1];
        }
        
        return ans;
    }
}
