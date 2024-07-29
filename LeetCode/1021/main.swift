/*
 1021. Remove Outermost Parentheses
 
 A valid parentheses string is either empty "", "(" + A + ")", or A + B, where A and B are valid parentheses strings, and + represents string concatenation.

 For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.
 A valid parentheses string s is primitive if it is nonempty, and there does not exist a way to split it into s = A + B, with A and B nonempty valid parentheses strings.

 Given a valid parentheses string s, consider its primitive decomposition: s = P1 + P2 + ... + Pk, where Pi are primitive valid parentheses strings.

 Return s after removing the outermost parentheses of every primitive string in the primitive decomposition of s.

  
 Constraints:
 1 <= s.length <= 105
 s[i] is either '(' or ')'.
 s is a valid parentheses string.
 */

import Foundation

class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var result = ""
        var sum = 0

        for char in s {
            if char == "(" {
                if sum > 0 {
                    result.append(char)
                }
                sum += 1
            } else if char == ")" {
                sum -= 1
                if sum > 0 {
                    result.append(char)
                }
            }
        }

        return result
    }
}

let s = "(()())(())(()(()))"
let solution = Solution()
print(solution.removeOuterParentheses(s))


/*
 Example 1:
 Input: s = "(()())(())"
 Output: "()()()"
 Explanation:
 The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
 After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
 
 Example 2:
 Input: s = "(()())(())(()(()))"
 Output: "()()()()(())"
 Explanation:
 The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
 After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
 
 Example 3:
 Input: s = "()()"
 Output: ""
 Explanation:
 The input string is "()()", with primitive decomposition "()" + "()".
 After removing outer parentheses of each part, this is "" + "" = "".
 */
