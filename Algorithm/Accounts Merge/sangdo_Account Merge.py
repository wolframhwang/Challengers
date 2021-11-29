class Solution:
    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:
        pa = [-1]*len(accounts)
        def getParent(p):
            if pa[p] < 0 : return p
            pa[p] = getParent(pa[p])
            return pa[p]
        
        def join(a,b):
            a = getParent(a)
            b = getParent(b)
            if a == b: return
            if pa[a] > pa[b]: a,b = b,a
            pa[a] += pa[b]
            pa[b] = a 
        
        email_to_id = {}
        for i,v in enumerate(accounts):
            for email in v[1:]:
                if email not in email_to_id:
                    email_to_id[email] = i
                else:
                    join(i, email_to_id[email])
        emails = [[] for _ in accounts]
        for email in email_to_id:
            v = getParent(email_to_id[email])
            emails[v].append(email)
        ret = []
        
        for i,e in enumerate(emails):
            if e:
                e.sort()
                ret.append([accounts[i][0]] + e)
                
        return ret
