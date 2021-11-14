#include <bits/stdc++.h>
class CombinationIterator {
private:
    vector<string> CombSet;
    int front;
    void makeCombset(string characters, string Comb, int length, int loc){
        if(Comb.size() > 10000) return;
        if(Comb.size() == length){
            CombSet.push_back(Comb);
            return;
        }
        for(int i=loc;i<characters.length();i++){
            makeCombset(characters, Comb+characters[i], length, i+1);
        }
    };
public:
    CombinationIterator(string characters, int combinationLength) {
        makeCombset(characters, "", combinationLength, 0);
        front=0;
    }
    
    string next() {
        return CombSet[front++];
    }
    
    bool hasNext() {
        return (front<CombSet.size())?true: false;
    }
};

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * CombinationIterator* obj = new CombinationIterator(characters, combinationLength);
 * string param_1 = obj->next();
 * bool param_2 = obj->hasNext();
 */
