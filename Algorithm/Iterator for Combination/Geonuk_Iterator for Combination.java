class CombinationIterator {
    ArrayList<String> list;
    int idx;
    
    public CombinationIterator(String characters, int combinationLength) {
        idx = 0;
        list = new ArrayList<String>();
        
        init(characters, combinationLength, 0, new StringBuilder());
        //System.out.println(list.toString());
    }
    
    public String next() {
        return list.get(idx++);
    }
    
    public boolean hasNext() {
        if(list.size() > idx) return true;
        else return false;
    }
    
    private void init(String s, int len, int idx, StringBuilder sb){
        if(sb.length() == len){
            list.add(sb.toString());
            return;
        }
        
        for(int i = idx ; i < s.length(); ++i){
            sb.append(s.charAt(i));
            init(s, len, i + 1, sb);
            sb.deleteCharAt(sb.length() - 1);
        }
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * CombinationIterator obj = new CombinationIterator(characters, combinationLength);
 * String param_1 = obj.next();
 * boolean param_2 = obj.hasNext();
 */
