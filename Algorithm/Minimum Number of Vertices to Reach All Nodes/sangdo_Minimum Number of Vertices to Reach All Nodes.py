class Solution:
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        adj = [[] for _ in range(n)]
        for f,t in edges:
            adj[t].append(f)
            
        res = []
        chk = [0]*n
        
        def dfs(now):
            chk[now] = 1
            if(len(adj[now]) == 0):
                res.append(now)
                return
            
            for nxt in adj[now]:
                if chk[nxt] == 0:
                    dfs(nxt)
        for i in range(n):
            if chk[i] == 0:
                dfs(i)
                
        return res
        
