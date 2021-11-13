/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
struct node{
    int val;
    int index;
};
int* dailyTemperatures(int* temperatures, int temperaturesSize, int* returnSize){
    struct node *stack = (struct node*)malloc(temperaturesSize * sizeof(struct node));
    register int top=0;
    *returnSize = temperaturesSize;
    int *ret = (int *)malloc(temperaturesSize * sizeof(int));
    
    for(register int i=0;i<temperaturesSize;i++){
       for(int j = top-1; j>=0; j--){
            if(stack[j].val < temperatures[i]){
                ret[stack[j].index] = i-stack[j].index;
                top--;
            }
           else
               break;
        }
        ret[i]=0;
        stack[top].val = temperatures[i];
        stack[top++].index = i;
    }
    
    return ret;
}
