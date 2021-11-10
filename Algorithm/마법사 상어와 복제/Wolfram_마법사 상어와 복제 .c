#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

#define MAX 128000
struct qq {
    int x, y, d, cnt;
} q[MAX];
int front, rear;
int maxCnt = 0, step = 0;
int list[10];
int moveList[64][3], mcnt;
int fx[] = { 0, -1, -1, -1, 0, 1, 1, 1 };
int fy[] = { -1, -1, 0, 1, 1, 1, 0, -1 };

int sx[] = { -1, 0, 1, 0 };
int sy[] = { 0, -1, 0, 1 };
int sharkx, sharky;
int mapDir[4][4][8];
int copyMap[4][4][8];
int Smell[4][4];
int M, S;

void copy() {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 8; k++) {
                copyMap[i][j][k] = mapDir[i][j][k];
            }
        }
    }
}
void makeList() {
    moveList[mcnt][0] = list[0], moveList[mcnt][1] = list[1];
    moveList[mcnt++][2] = list[2];
}

void sequence(int cnt) {
    if(cnt == 3) {
        makeList();
        return;
    }
    for(int i = 1; i <= 4; i++){
        list[cnt] = i;
        sequence(cnt + 1);
    }
}
void revCopy() {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 8; k++) {
                mapDir[i][j][k] += copyMap[i][j][k];
            }
        }
    }
}
void moveFish() {
    rear = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            for (int k = 0; k < 8; k++) {
                if (mapDir[i][j][k] == 0) continue;
                for (int l = 0; l < 8; l++) {
                    int nd = (k - l);
                    if (nd < 0) nd += 8;
                    int nx = i + fx[nd], ny = j + fy[nd];
                    if(nx < 0 || nx >= 4 || ny < 0 || ny >= 4) continue;
                    if(Smell[nx][ny]) continue;
                    if(sharkx == nx && sharky == ny) continue;
                    q[rear].cnt = mapDir[i][j][k];
                    q[rear].x = nx, q[rear].y = ny, q[rear].d = nd;
                    rear += 1;
                    mapDir[i][j][k] = 0;
                    break;
                }
            }
        }
    }

    for (int i = 0; i < rear; i++) {
        mapDir[q[i].x][q[i].y][q[i].d] += q[i].cnt;
    }
}

int hunt(int step) {
    int skx = sharkx, sky = sharky;
    int cnt = 0;
    int temp[4][4][8];
    for(int i = 0; i < 4; i++) for(int j = 0; j < 4; j++) for(int k = 0; k < 8; k++) temp[i][j][k] = mapDir[i][j][k];
    for(int i = 0; i < 3; i++){
        int nx = skx + sx[moveList[step][i] - 1];
        int ny = sky + sy[moveList[step][i] - 1];
        if (nx < 0 || nx >= 4 || ny < 0 || ny >= 4) return -1;
        for(int d = 0; d < 8; d++){
            cnt += temp[nx][ny][d];
            temp[nx][ny][d] = 0;
        }
        skx = nx;
        sky = ny;
    }
    return cnt;
}


void hunting(int stage) {
    for (int x = 0; x < 3; x++) {
        sharkx += sx[moveList[stage][x] - 1];
        sharky += sy[moveList[stage][x] - 1];

        for (int i = 0; i < 8; i++) {
            if(mapDir[sharkx][sharky][i] == 0)
                continue;
            Smell[sharkx][sharky] = 3;
            mapDir[sharkx][sharky][i] = 0;
        }
    }
}

void DelSmell() {
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (Smell[i][j]) Smell[i][j] -= 1;
        }
    }
}


int answer = 0;
void print() {
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            for (int k = 0; k < 8; k++)
                answer += mapDir[i][j][k];
}

int main() {
    scanf("%d %d", &M, &S);
    for (int i = 0; i < M; i++) {
        int x, y, d;
        scanf("%d %d %d", &x, &y, &d);
        mapDir[x - 1][y - 1][d - 1] += 1;
    }
    scanf("%d %d", &sharkx, &sharky);
    sharkx -= 1;
    sharky -= 1;
    sequence(0);
    for (int i = 1; i <= S; i++) {
        copy();
        moveFish();
        maxCnt = -1, step = -1;
        for(int j = 0; j < 64; j++){
            int num = hunt(j);
            if(num > maxCnt) { maxCnt = num, step = j;}
        }
        hunting(step);
        DelSmell();
        revCopy();
        //print();
    }
    answer = 0;
    print();
    printf("%d\n", answer);
    return 0;
}
