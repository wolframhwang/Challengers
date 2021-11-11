import sys
import heapq

dc = [-1,-1,0,1,1,1,0,-1]
dr = [0,-1,-1,-1,0,1,1,1]

class FISH:
    def __init__(self, p,d):
        self.p = p
        self.d = d
        
class DATA:
    def __init__(self, p,fn, d):
        self.p = p
        self.fn = fn
        self.d = d
    def __lt__(self,other):
        return self.d < other.d if other.fn == self.fn else self.fn > other.fn
        
input = sys.stdin.readline
m, s = map(int, input().split())

mp = [[[[] for _ in range(4) ] for _ in range(4) ] for _ in range(2)]

t = 1
for i in range(m):
    r,c,d = map(int, input().split())
    r-=1
    c-=1
    d-=1
    mp[t][r][c].append(FISH((r,c), d))

sx, sy = map(int, input().split())
sx-=1
sy-=1

smell = [[[0]*4 for _ in range(4)] for _ in range(s+5)]
dir = []
sdr = [-1,0,1,0]
sdc = [0,-1,0,1]
for i in range(0,4):
    for j in range(0, 4):
        for k in range(0,4):
            dir. append((i,j,k))

for t in range(1, s+1):
    for r in range(4):
        for c in range(4):
            smell[t][r][c] += smell[t-1][r][c]

    nextMap = [[[] for _ in range(4)] for _ in range(4)]
    for r in range(4):
        for c in range(4):
            for f in mp[t][r][c]:
                fr,fc = f.p
                fd = f.d
                d = 9
                while d > 0:
                    d-=1
                    if(d == 0): break
                    nr = fr + dr[(d+fd)%8]
                    nc = fc + dc[(d+fd)%8]
                    if nr < 0 or nc < 0 or nr == 4 or nc == 4: continue
                    if smell[t][nr][nc] > 0: continue
                    if sx == nr and sy == nc: continue
                    break
                if d != 0:
                    fr += dr[(d+fd)%8]
                    fc += dc[(d+fd)%8]
                    fd = (fd + d)%8
                nextMap[fr][fc].append(FISH((fr,fc), fd))
            
    sel = 0
    pq = []
    temp = []
    for ii in range(len(dir)):
        dirs = dir[ii]
        cango = True
        nx = sx
        ny = sy
        eat = 0
        for i in dirs:
            nx += sdr[i]
            ny += sdc[i]
            if(nx < 0 or ny < 0 or nx == 4 or ny == 4):
                cango = False
                break
            eat += len(nextMap[nx][ny])
            temp.append((nx,ny,nextMap[nx][ny]))
            nextMap[nx][ny] = []

        while temp:
            x,y,n = temp.pop()
            nextMap[x][y] = n

        if cango:
            heapq.heappush(pq, DATA((nx,ny),eat, ii))

    sel = pq[0].d
    for i in dir[sel]:
        sx += sdr[i]
        sy += sdc[i]
        smell[t][sx][sy] += len(nextMap[sx][sy])
        smell[t+3][sx][sy] -= len(nextMap[sx][sy])
        nextMap[sx][sy].clear()

    for r in range(4):
        for c in range(4):
            nextMap[r][c] += mp[t][r][c]
    mp.append(nextMap)
    
res = 0
for i in mp[-1]:
    for j in i:
        res += len(j)
print(res)
