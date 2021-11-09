from collections import defaultdict


def dfs(start, visit):
    global cnt
    visit.append(start)
    cnt += 1
    for i in tree[start]:
        if i not in visit:
            dfs(i, visit)


def solution(n, wires):
    global tree, cnt
    tree = defaultdict(list)
    answer = 1e9
    
    for x, y in wires:
        tree[x].append(y)
        tree[y].append(x)
    
    for x, y in wires:
    	# 끊을 전선
        tree[x].remove(y)
        tree[y].remove(x)
        
        # 끊은 전선을 시작점으로 해서 dfs를 돌려본다
        cnt = 0
        dfs(1, [])
        
        answer = min(answer, abs(n - (cnt*2)))
        
        # 끊은 전선 복구
        tree[x].append(y)
        tree[y].append(x)
        
    return answer