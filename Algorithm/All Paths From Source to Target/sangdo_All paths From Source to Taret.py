class Solution:
    def dfs(self, graph, now, l, li, chk):
        if len(graph)-1 == now:
            self.res.append(list(li))
            return self.res
        for nxt in graph[now]:
            if chk[nxt] == 1: continue
            li.append(nxt)
            chk[nxt] = 1
            self.dfs(graph, nxt,l-1, li, chk)
            chk[nxt] = 0
            li.pop()
        return self.res
            
    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        self.res = []
        chk = [0]* len(graph)
        chk[0] = 1
        return self.dfs(graph, 0, len(graph)-1, [0], chk)
