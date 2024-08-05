/*
 DFS
 https://www.acmicpc.net/problem/2667
 
 1. 아이디어
 - 2중 for문, 값 1 && 방문X => DFS
 - DFS를 통해 찾은 값을 저장 후 정렬 해서 출력
 
 2. 시간 복잡도
 - DFS : O(V+E)
 - V, E : N^2, 4N^2
 - V+E : 5N^2 ~= N^2 ~= 625 >> 가능
 
 3. 자료구조
 - 그래프 저장 : int[][]
 - 방문여부 : bool[][]
 - 결과값 : int[]

 */
import Foundation

let N = Int(readLine()!)!
var graph: [[Int]] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

var result: [Int] = []
var each = 0

for _ in 0..<N {
    let line = readLine()!.map { Int(String($0))! }
    graph.append(line)
}

// 방향 벡터 (우, 하, 좌, 상)
let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func dfs(_ y: Int, _ x: Int) {
    each += 1
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        if ny >= 0 && ny < N && nx >= 0 && nx < N {
            if graph[ny][nx] == 1 && !visited[ny][nx] {
                visited[ny][nx] = true
                dfs(ny, nx)
            }
        }
    }
}

for j in 0..<N {
    for i in 0..<N {
        if (graph[j][i] == 1) && (visited[j][i] == false) {
            visited[j][i] = true
            each = 0
            dfs(j, i)
            result.append(each)
        }
    }
}

result.sort()
print(result.count)
for i in result {
    print(i)
}
