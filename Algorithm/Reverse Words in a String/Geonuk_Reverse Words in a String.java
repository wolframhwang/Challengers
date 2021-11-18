class Solution {
    public String reverseWords(String s) {
        ArrayList<String> list = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        for(int i = 0 ; i < s.length() ; ++i){
            char c = s.charAt(i);
            //System.out.println("idx " + i + " Value " + c + " String " + sb.toString());
            if(c == ' ') {
                if(sb.length() > 0){
                    list.add(sb.toString());
                    sb = new StringBuilder();
                    //System.out.println("list : "+list.toString());

                } else continue;
            } else {
                sb.append(c);
            }
        }
        
        
        if(sb.length() > 0) list.add(sb.toString());
        
        sb = new StringBuilder();
        
        for(int i = list.size()-1 ; i >= 0 ; i--) {
            sb.append(list.get(i) + " ");
        }
        
        return sb.toString().trim();
    }
}
