from collections import deque
conv = {'S': 0, 'L': 3, 'R': 1}
dr = (-1,0,1,0)
dc = (0,1,0,-1)

def solution(grid):
    n,m = len(grid), len(grid[0])
    
    dp = [[[-1]*m for _ in range(n)] for _ in range(4)]
    dq = deque()
    answer = []
    for i in range(n):
        for j in range(m):
            for d in range(4):
                if dp[d][i][j] == -1:
                    cnt = 0
                    dp[d][i][j] = 0
                    dq.append((i,j,d))
                    
                    while dq:
                        cnt+=1
                        count = len(dq)
                        while count:
                            count-=1
                            r,c,d = dq.popleft()

                            nd = (d+conv[grid[r][c]]) %4
                            nr, nc = (n+r + dr[nd])%n, (c + dc[nd]+m)%m
                            if dp[nd][nr][nc] != -1:
                                answer.append(cnt - dp[nd][nr][nc])
                            else:
                                dp[nd][nr][nc] = cnt
                                dq.append((nr,nc,nd))
    answer.sort()
    return answer
