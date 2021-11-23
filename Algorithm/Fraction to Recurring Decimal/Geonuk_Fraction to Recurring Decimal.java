class Solution {
    public String fractionToDecimal(int numerator, int denominator) {
        if(numerator == 0) return "0";
        
        StringBuilder sb = new StringBuilder();
        boolean flag = false;
        if(numerator < 0 || denominator < 0) flag = true;
        if(numerator < 0 && denominator < 0) flag = false;
        
        long num = Math.abs((long)numerator);
        long den = Math.abs((long)denominator);
        
        long n = num / den;
        long remainder = (num % den) * 10;
        
        sb.append(flag ? "-" : "");
        sb.append(n);
        sb.append(remainder!=0?".":"");
        
        HashMap<Long, Integer> map = new HashMap<>();
    
        while (remainder != 0) {
    
            if (map.containsKey(remainder)) {
                int len = map.get(remainder);
                sb.insert(len,'(');
                sb.append(')');
                break;
            } 

            map.put(remainder, sb.length());
            n = remainder / den;
            sb.append(n);
            remainder = (remainder % den) * 10;
        }
        
        return sb.toString();
    }
}
