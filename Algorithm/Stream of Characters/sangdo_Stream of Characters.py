class Trie:
    def __init__(self):
        self.childs = [None]*26
        self.fail = None
        self.isEnd = False
        self.v = 0
        
class StreamChecker:
    def __init__(self, words: List[str]):
        self.root = Trie()
        self.stream = self.root
        for s in words:
            now = self.root
            
            for c in s:
                v = ord(c) - ord('a')
                if now.childs[v] == None:
                    now.childs[v] = Trie()
                    now.childs[v].v = v
                now = now.childs[v]
            now.isEnd = True
                
        Q = deque()
        self.root.fail = None
        for c in self.root.childs:
            if c == None: continue
            Q.append(c)
            
            
        while Q:
            now = Q.popleft()
            v = now.v
            fail = now.fail
            
            while fail:
                if fail.childs[v] != None: 
                    fail = fail.childs[v]
                    break
                fail = fail.fail
                
            now.fail = self.root if fail == None else fail
            now.isEnd |= now.fail.isEnd
            for c in now.childs:
                if c is None: continue
                c.fail = now.fail
                Q.append(c)
                
        

    def query(self, letter: str) -> bool:
        v = ord(letter) - ord('a')
        while self.stream:
            if self.stream.childs[v] == None:
                self.stream = self.stream.fail
            else:
                self.stream = self.stream.childs[v]
                break
        if self.stream == None:
            self.stream = self.root
        return self.stream.isEnd
