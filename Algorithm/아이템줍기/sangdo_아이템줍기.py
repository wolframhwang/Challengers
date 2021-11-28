from collections import deque
cr = [-1, 0, 0, 0]
cc = [0,0,0,-1]
cb = [1,2,1,2]
dr = [-1,0,1,0]
dc = [0,1,0,-1]

def solution(rectangle, characterX, characterY, itemX, itemY):
    answer = 0
    rect = [[0]*52 for _ in range(52)]
    arr = [[0]*52 for _ in range(52)]
    line = [[0]*52 for _ in range(52)]
    
    for x1,y1, x2,y2 in rectangle:
        for x in range(x1, x2):
            rect[y1][x] |= 2
            rect[y2][x] |= 2
        for y in range(y1, y2):
            rect[y][x1] |= 1
            rect[y][x2] |= 1
    
    for x1, y1, x2, y2 in rectangle:
        for x in range(x1+1,x2):
            for y in range(y1,y2):
                rect[y][x] &= 2
        for y in range(y1+1, y2):
            for x in range(x1,x2):
                rect[y][x] &= 1
    
    chk = [[0]*51 for _ in range(51)]
    chk[characterY][characterX] = 1
    dq = deque([(characterY, characterX)])
    res = 0
    dp = [[0x3f3f3f3f]*51 for _ in range(51)]
    dp[characterY][characterX] = 0
    
    while dq:
        r,c = dq.popleft()
        for d in range(4):
            nr, nc = r + dr[d] , c + dc[d]
            if 0<= nr <= 50 and 0 <= nc <= 50:
                chkr, chkc = r + cr[d], c + cc[d]
                chkb = rect[chkr][chkc] & cb[d]
                
                if chkb != 0:
                    if dp[nr][nc] > dp[r][c] + 1:
                        dp[nr][nc] = dp[r][c]+1
                        dq.append((nr,nc))
                        
    return dp[itemY][itemX]
