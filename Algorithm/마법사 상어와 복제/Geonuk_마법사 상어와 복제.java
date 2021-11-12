import java.util.*;
import java.io.*;

public class Main {
    private static int stoi(String s) { return Integer.parseInt(s);}

    private static int M, S, sc, sr;
    private static LinkedList<Integer>[][] map = new LinkedList[5][5];
    private static int[][] fished = new int[5][5];
    private static int[][] dir = {{0,0}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}, {1, -1}};
    private static int[][] sdir = {{0, 0}, {-1, 0}, {0, -1}, {1, 0}, {0, 1}};
    private static int[] smove = new int[64];

    private static class fish {
        int c, r, d;

        fish(int r, int c, int d){
            this.c = c;
            this.r = r;
            this.d = d;
        }
    }

    private static void init(){
        int sum = 0;
        int idx = 0;
        for(int i = 1 ; i <= 4; ++i){
            sum += i * 100;
            for(int ii = 1 ; ii <= 4 ; ++ii ){
                sum += ii * 10;
                for(int iii = 1 ; iii <= 4 ; ++iii){
                    sum += iii;
                    smove[idx++] = sum;
                    sum -= iii;
                }
                sum -= ii * 10;
            }
            sum -= i * 100;
        }

        for(int r = 0 ; r < 5 ; ++r){
            for(int c = 0 ; c < 5 ; ++c){
                map[r][c] = new LinkedList<>();
            }
        }
    }

    public static void main(String[] args) throws IOException {
        init();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        M = stoi(st.nextToken());
        S = stoi(st.nextToken());

        ArrayList<LinkedList<fish>> list = new ArrayList<>();
        
        for(int i = 0 ; i < M ; ++i){
            st = new StringTokenizer(br.readLine());
            int fr = stoi(st.nextToken());
            int fc = stoi(st.nextToken());
            int d = stoi(st.nextToken());

            map[fr][fc].add(d);
        }

        st = new StringTokenizer(br.readLine());

        sr = stoi(st.nextToken());
        sc = stoi(st.nextToken());
        
        while(S-->0){ // 1. 복제마법 시작
            ArrayList<LinkedList<fish>> copy = new ArrayList<>();
            
            for(int r = 1 ; r < 5 ; ++r) {
                LinkedList<fish> tmp = new LinkedList<>();
                for(int c = 1; c < 5 ; ++c){
                    LinkedList<Integer> direct = map[r][c];
                    for(int i : direct) tmp.add(new fish(r, c, i));
                }
                copy.add(tmp);
            }

            //2. 모든 물고기 한 칸 이동 but, 상어가 있거나, 물고기 냄새가 있으면 이동x -> 이동 불가시 가능할때까지 45도 반시계 방향으로 가능할때까지 회전 및 전진( + 7 > 8 ? %8 )
            LinkedList<Integer>[][] newMap = new LinkedList[5][5];
            for(int r = 0 ; r < 5 ; ++r){
                for(int c = 0 ; c < 5 ; ++c){
                    newMap[r][c] = new LinkedList<>();
                }
            }
            for(int r = 1; r < 5 ; ++r){
                for(int c = 1; c < 5 ; ++c){
                    LinkedList<Integer> fmove = map[r][c];
                    for(int i : fmove){
                        int nr = r + dir[i][0];
                        int nc = c + dir[i][1];
                        
                        if(!isPossible(nr, nc) || fished[nr][nc] != 0 || (nr == sr && nc == sc)) {
                            int idx = 0;
                            while(idx<8){
                                idx++;
                                i += 7;
                                if(i > 8) i %= 8;
                                int nnr = r + dir[i][0];
                                int nnc = c + dir[i][1];

                                if(isPossible(nnr, nnc) && fished[nnr][nnc] == 0 && !(nnr == sr && nnc == sc)) break;
                            }
                            if(idx >= 8) {
                                newMap[r][c].add(i);
                                continue;
                            }
                            nr = r + dir[i][0];
                            nc = c + dir[i][1];
                        }
                        newMap[nr][nc].add(i);
                    }
                }
            }

            for(int r = 1; r < 5 ; ++r){
                for(int c = 1; c < 5 ; ++c){
                    map[r][c].clear();
                    map[r][c].addAll(newMap[r][c]);
                }
            }

            //3. 상어 이동 및 물고기 잡아먹기
            removeFish(shark());
            
            //4. 두번 전 물고기 냄새 삭제

            for(int r = 1 ; r < 5 ; ++r){
                for(int c = 1; c < 5 ; ++c){
                    if(fished[r][c] > 0) fished[r][c]--;
                }
            }

            //5. 물고기 복사 실행
            
            for(LinkedList<fish> l : copy){
                for(fish f : l){
                    map[f.r][f.c].add(f.d);
                }
            }
        }
        int cnt = 0;
        for(int r = 1 ; r < 5 ; ++r){
            for(int c = 1; c < 5 ; ++c){
                cnt += map[r][c].size();
            }
        }

        System.out.println(cnt);

    }    

    private static void removeFish(int d){
        int i = smove[d] / 100;
        int ii = (smove[d] / 10) % 10 ;
        int iii = smove[d] % 10;

        int nr = sr + sdir[i][0];
        int nc = sc + sdir[i][1];
        if(map[nr][nc].size() > 0 ) fished[nr][nc] = 3;
        map[nr][nc].clear();

        nr += sdir[ii][0];
        nc += sdir[ii][1];
        if(map[nr][nc].size() > 0 ) fished[nr][nc] = 3;
        map[nr][nc].clear();
        
        nr += sdir[iii][0];
        nc += sdir[iii][1];
        if(map[nr][nc].size() > 0 ) fished[nr][nc] = 3;
        map[nr][nc].clear();
        
        sr = nr;
        sc = nc;
    }

    private static int shark(){
        int res = 0;
        int cnt = Integer.MIN_VALUE;
        
        for(int i = 0 ; i < 64 ; ++i){
            boolean[][] ate = new boolean[5][5];

            int j = smove[i] / 100;
            int jj = (smove[i] / 10) % 10 ;
            int jjj = smove[i] % 10;

            int sum = 0;
            
            int nr = sr + sdir[j][0];
            int nc = sc + sdir[j][1];

            if(!isPossible(nr,nc)) continue; 
            if(!ate[nr][nc]) sum += map[nr][nc].size();
            if(map[nr][nc].size() > 0) ate[nr][nc] = true;


            nr += sdir[jj][0];
            nc += sdir[jj][1];

            if(!isPossible(nr,nc)) continue; 
            if(!ate[nr][nc]) sum += map[nr][nc].size();
            if(map[nr][nc].size() > 0) ate[nr][nc] = true;

            nr += sdir[jjj][0];
            nc += sdir[jjj][1];

            if(!isPossible(nr,nc)) continue; 
            if(!ate[nr][nc]) sum += map[nr][nc].size();
            if(map[nr][nc].size() > 0) ate[nr][nc] = true;

            if(sum == 0 && cnt == Integer.MIN_VALUE) {
                res = i;
                cnt = 0;
            }
            if(sum != 0 && cnt < sum){
                res = i;
                cnt = sum;
            }
        }

        return res;
    }

    private static boolean isPossible(int r, int c){
        if(r < 1 || r >= 5 || c < 1 || c >= 5) return false;
        return true;
    }
}
