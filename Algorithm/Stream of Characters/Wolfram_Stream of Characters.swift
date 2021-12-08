// solved by Wolfram Hwang
// 왜 안올라깟지?;;

class Trie {
    var val: Character
    var dict = [Character: Trie]()
    var end: Bool = false

    init(_ val: Character) {
        self.val = val
    }
}

class Node {
    var val: Character
    var next: Node?

    init(_ val: Character) {
        self.val = val
    }
}

class StreamChecker {
    var trie = Trie("*")
    var node: Node?
    var maxi: Int = 0
    init(_ words: [String]) {
        for word in words {
            populate(&trie, word)
        }
    }
    
    func populate(_ trie: inout Trie, _ word: String) {
        var temp: Trie? = trie
        let array = Array(word)
        maxi = max(maxi, array.count)
        for letter in Array(word).reversed() {
            if temp?.dict[letter] == nil {
                temp?.dict[letter] = Trie(letter)
            }

            temp = temp?.dict[letter]
        }

        temp?.end = true
    }
    
    func query(_ letter: Character) -> Bool {
        let newNode = Node(letter)
        if node == nil {
            node = newNode
        } else {
            newNode.next = node
            node = newNode
        }
        
        return search(trie, node)
    }
    
    func search(_ trie: Trie, _ node: Node?) -> Bool {
        var count = 0
        var temp: Node? = node
        var tempTrie: Trie? = trie
        while count <= maxi {
            if let current = temp?.val {
                count += 1
                if tempTrie?.dict[current] != nil {
                    tempTrie = tempTrie?.dict[current]
                    if tempTrie?.end ?? false {
                        return true
                    }
                } else {
                    return false
                }
                
                temp = temp?.next
            } else {
                return false
            }
        }
        
        return false
    }
