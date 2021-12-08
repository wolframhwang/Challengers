class Solution {
     List<List<Integer>> res;
    
    public List<List<Integer>> allPathsSourceTarget(int[][] graph) {
        
        res = new ArrayList<>();
        
        List<Integer> tmp = new ArrayList<>();
        rec(graph, 0, tmp);
        
        return res;
    }
    
    public void rec(int[][] map, int cur, List<Integer> list){
        //System.out.println("Cur " + cur + " List " + list.toString() + " Array " + Arrays.toString(map[cur]));
        
        if(cur == map.length-1){
            list.add(cur);
            
            List<Integer> tmp = new ArrayList<>();
            tmp.addAll(list);
            res.add(tmp);
            // for(int i = 0 ; i < res.size() ; ++i)
            //     System.out.println(res.get(i).toString());
            
            list.remove(list.size()-1);
            
            return;
        }
        
        for(int i = 0 ; i < map[cur].length ; ++i){
            list.add(cur);
            rec(map, map[cur][i], list);
            list.remove(list.size()-1);
        }
    }
}
