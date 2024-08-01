/*
 BFS
 https://www.acmicpc.net/problem/1926
 
 1.  아이디어
 - 2중 for -> 값 1 && 방문 x => BFS
 - BFS 돌면서 그림 개수 +1, 최대값을 갱신
 
 2. 시간복잡도
 - BFS: O(V+E)
 - V: 500 * 500
 - E: 4 * 500 * 500
 - V+E : 5 * 250000 = 100만 < 2억 >> 가능!
 
 3. 자료구조
 - 그래프 전체 지도: int[][]
 - 방문: bool[][]
 - Queue(BFS)
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]


var map: [[Int]] = []
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(row)
}
var chk = Array(repeating: Array(repeating: false, count: m), count: n)


let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func bfs(_ y: Int, _ x: Int) -> Int {
    var rs = 1
    var queue: [(Int, Int)] = [(y, x)]
    var index = 0

    while index < queue.count {
        let (ey, ex) = queue[index]
        index += 1
        for k in 0..<4 {
            let ny = ey + dy[k]
            let nx = ex + dx[k]
            if ny >= 0 && ny < n && nx >= 0 && nx < m {
                if map[ny][nx] == 1 && !chk[ny][nx] {
                    rs += 1
                    chk[ny][nx] = true
                    queue.append((ny, nx))
                }
            }
        }
    }

    return rs
}

var cnt = 0
var maxv = 0
for j in 0..<n {
    for i in 0..<m {
        if map[j][i] == 1 && !chk[j][i] {
            chk[j][i] = true
            cnt += 1
            maxv = max(maxv, bfs(j, i))
        }
    }
}


print(cnt)
print(maxv)
