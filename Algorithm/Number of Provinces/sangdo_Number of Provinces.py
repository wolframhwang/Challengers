class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        pa = [-1]*len(isConnected)
        def get_parent(a):
            if pa[a] < 0 :return a
            pa[a] = get_parent(pa[a])
            return pa[a]
        
        def join(a,b):
            p1,p2 = get_parent(a), get_parent(b)
            if p1 == p2: return
            
            if pa[p1] < pa[p2]: p1, p2 = p2,p1
            pa[p2] += pa[p1]
            pa[p1] = p2
        
        for i,li in enumerate(isConnected):
            for j, c in enumerate(li):
                if c == 1:
                    join(i,j)
        chk = set()
        res = 0
        for i in range(len(isConnected)):
            p = get_parent(i)
            if p not in chk: 
                res+=1
                chk.add(p)
        return res
