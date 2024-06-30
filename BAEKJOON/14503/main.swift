/*
 Simulation
 
 시간복잡도
 - O(NM): 50^2 = 2500
 
 */
import Foundation

let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstInput[0]
let M = firstInput[1]

let secondInput = readLine()!.split(separator: " ").map { Int($0)! }
var r = secondInput[0]
var c = secondInput[1]
var d = secondInput[2]

var room = [[Int]]()

for _ in 0..<N {
    room.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// 방향 (북,동,남,서)
let dr = [-1, 0, 1, 0]
let dc = [0, 1, 0, -1]

// 현재 위치를 청소
var result = 0

// 청소 작업을 시작하는 루프
while true {
    // 현재 칸이 아직 청소되지 않은 경우, 현재 칸을 청소
    if room[r][c] == 0 {
        room[r][c] = 2 // 청소한 곳은 2로 표시
        result += 1
    }
    
    // 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 있는 경우
    var moved = false
    for _ in 0..<4 {
        // 반시계 방향으로 90도 회전
        d = (d + 3) % 4
        let nr = r + dr[d]
        let nc = c + dc[d]
        
        // 바라보는 방향을 기준으로 앞쪽 칸이 청소되지 않은 빈 칸인 경우 한 칸 전진
        if nr >= 0 && nr < N && nc >= 0 && nc < M && room[nr][nc] == 0 {
            r = nr
            c = nc
            moved = true
            break
        }
    }
    
    // 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 없는 경우
    if !moved {
        // 바라보는 방향을 유지한 채로 한 칸 후진할 수 있다면 한 칸 후진하고 1번으로
        let back = (d + 2) % 4
        let nr = r + dr[back]
        let nc = c + dc[back]
        
        // 뒤쪽이 벽이라 후진할 수 없는 경우 작동을 멈춘다
        if nr >= 0 && nr < N && nc >= 0 && nc < M && room[nr][nc] != 1 {
            r = nr
            c = nc
        } else {
            break // 후진도 할 수 없는 경우 탈출
        }
    }
}

print(result)
