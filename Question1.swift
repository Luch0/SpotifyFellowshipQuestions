/*
Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".
*/

func sortByStrings(s: String, t: String) -> String {
    let sAsArray: [String] = Array(s).map{ String($0) }
    let tAsArray: [String] = Array(t).map{ String($0) }
    
    var str1Dict: [String:Int] = [String:Int]()
    for letter in sAsArray {
        if str1Dict[letter] == nil {
            str1Dict.updateValue(1, forKey: letter)
        } else {
            str1Dict.updateValue(str1Dict[letter]! + 1, forKey: letter)
        }
    }
    
    var strResult: String = ""
    for letter in tAsArray {
        if let letterCount = str1Dict[letter] {
            if letterCount > 1 {
                strResult.append(Array(repeating: letter, count: letterCount).joined())
            } else {
                strResult.append(letter)
            }
        }
    }
    return strResult
}

print(sortByStrings(s: "weather", t: "therapyw"))
print(sortByStrings(s: "good", t: "odg"))
