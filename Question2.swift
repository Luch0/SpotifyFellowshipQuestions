/*
 Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.
 
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.
 
 For s = "4[ab]", the output should be decodeString(s) = "abababab"
 For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
*/

func decodeString(s: String) -> String {
    let sAsArray = Array(s).map{ String($0) }
    var frequencyStack = Stack<Int>()
    var letterStack = Stack<String>()

    var letters: String = ""

    for letter in sAsArray {
        if isANumber(str: letter) {
            frequencyStack.push(data: Int(letter)!)
        } else if letter == "[" {
            continue
        } else if letter == "]" {
            if frequencyStack.size() > 1 {
                letterStack.push(data: Array(repeating: letterStack.pop()!, count: frequencyStack.pop()!).joined())
            } else {
                letters = letterStack.stackArray().joined()
                letterStack.clearStack()
                letterStack.push(data: Array(repeating: letters, count: frequencyStack.pop()!).joined())
            }
            letters = ""
        } else {
            letterStack.push(data: letter)
        }

    }

    return letterStack.pop()!
}

print(decodeString(s: "4[ab]"))
print(decodeString(s: "2[b3[a]]"))

func isANumber(str: String) -> Bool {
    return "0123456789".contains(str)
}

class Stack<T> {
    private var stack: [T]
    init() {
        self.stack = []
    }

    func isEmpty() -> Bool {
        return stack.isEmpty
    }

    func push(data: T) {
        stack.append(data)
    }

    func pop() -> T? {
        if isEmpty() {
            return nil
        } else {
            return stack.popLast()
        }
    }

    func peek() -> T? {
        if isEmpty() {
            return nil
        } else {
            return stack[stack.count-1]
        }
    }

    func size() -> Int {
        return stack.count
    }
    
    func stackArray() -> [T] {
        return stack
    }

    func clearStack() {
        self.stack = []
    }
}
