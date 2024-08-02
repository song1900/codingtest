/*
 BFS
 https://www.acmicpc.net/problem/2606
 
 - graph: 컴퓨터의 번호를 인덱스로 하고, 연결된 컴퓨터의 번호들을 배열로 가지는 배열
 - visited: 방문 체크를 위한 배열
 
 */

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    // 양방향 그래프 처리
    let a = input[0], b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}
// [[], [2, 5], [1, 3, 5], [2], [7], [1, 2, 6], [5], [4]]

func bfs(node: Int) {
    
    var queue = [node]
    var index = 0
    visited[node] = true
    
    while queue.count > index {
        let currentNode = queue[index]
        for nextNode in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append(nextNode)
            }
        }
        index += 1
    }
}

bfs(node: 1)
print(visited.filter { $0 }.count - 1) // 시작한 컴퓨터는 제외 (-1)
