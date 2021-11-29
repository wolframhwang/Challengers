// 211128 solved by Wolfram Hwang
// 어...음.. 

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
typedef struct
{
    int y, x, cnt;
} Status;
typedef struct
{
    int y, x;
} Dir;


Dir moveDir[4] = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};

int map[101][101];
int check[10];
int fx, fy;
int mxp;
int totalLen, halfLen;
int param[101][101][4];
int visit[101][101];
Status q[10000];
int front = 0, rear = 0;


int solution(int **rectangle, size_t rectangle_row_len, size_t rectangle_col_len, int characterX, int characterY, int itemX, int itemY) {
    int answer = 0;

    for(int i = 0; i < rectangle_row_len; i++){
        for(int j = rectangle[i][0] * 2; j <= rectangle[i][2] * 2; j++){
            param[rectangle[i][1] * 2][j][2] = 1;
            param[rectangle[i][3] * 2][j][2] = 1;
            param[rectangle[i][1] * 2][j][3] = 1;
            param[rectangle[i][3] * 2][j][3] = 1;
        }
        for(int y = rectangle[i][1] * 2; y <= rectangle[i][3] * 2; y++){
            param[y][rectangle[i][0] * 2][0] = 1;
            param[y][rectangle[i][2] * 2][0] = 1;
            param[y][rectangle[i][0] * 2][1] = 1;
            param[y][rectangle[i][2] * 2][1] = 1;
        }
    }

    for(int i = 0; i < rectangle_row_len; i++){
        for(int y = rectangle[i][1] * 2 + 1; y < rectangle[i][3] * 2;  y++){
            for(int x = rectangle[i][0] * 2 + 1; x < rectangle[i][2] * 2; x++){
                for(int k = 0; k < 4; k++){
                    param[y][x][k] = 0;
                }
            }
        }
    }
    q[rear].y = characterY * 2;
    q[rear].x = characterX * 2;
    q[rear].cnt = 0;
    rear += 1;
    visit[characterY * 2][characterX * 2] =  1;
    while( front != rear) {
        int nowY = q[front].y;
        int nowX = q[front].x;
        int cnt = q[front].cnt;
        front += 1;
        if(nowY == itemY * 2 && nowX == itemX * 2) {
            return cnt / 2;

        }
        for(int i = 0; i < 4; i++){
            int nx = nowX + moveDir[i].x;
            int ny = nowY + moveDir[i].y;

            if(nx < 2 || nx > 100 || ny < 2 || ny > 100) {
                continue;

            }

            if(!param[ny][nx][i] || visit[ny][nx]) continue;

            visit[ny][nx] = 1;
            q[rear].y = ny;
            q[rear].x = nx;
            q[rear].cnt = cnt + 1;
            rear += 1;
        } 
    }
    return -1;
}
