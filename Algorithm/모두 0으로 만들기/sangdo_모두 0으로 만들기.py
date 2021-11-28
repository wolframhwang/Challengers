from collections import deque
import sys
sys.setrecursionlimit(300000)

def solution(a, edges):
    n = len(a)
    adj = [[] for _ in range(n)]
    
    for f,t in edges:
        adj[f].append(t)
        adj[t].append(f)
        
    def getSum(prev, now,a, adj):
        ret = 0
        for nxt in adj[now]:
            if prev == nxt: 
                continue
            ret += getSum(now, nxt, a, adj)
            a[now] += a[nxt]
        return ret + abs(a[now])
    ret = getSum(-1,0, a,adj)
    return ret if a[0] == 0 else -1
