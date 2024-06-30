/*
 Backtracking
*/

import Foundation

if let input = readLine() {
    let parts = input.split(separator: " ").map { Int($0)! }
    let N = parts[0]
    let M = parts[1]

    // 수열을 저장할 배열
    var sequence = [Int]()

    func backtrack(_ count: Int) {
        if count == M {
            print(sequence.map { String($0) }.joined(separator: " "))
            return
        }
        
        for i in 1...N {
            if !sequence.contains(i) {
                sequence.append(i)
                backtrack(count + 1)
                sequence.removeLast()
            }
        }
    }

    backtrack(0)
}
