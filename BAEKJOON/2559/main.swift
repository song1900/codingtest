/*
 Two Pointers
 
 */

import Foundation

let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstInput[0]
let K = firstInput[1]

let secondInput = readLine()!.split(separator: " ").map { Int($0)! }

// 초기 포인터 설정
var left = 0
var right = K - 1

// 첫 번째 K일 동안의 합 계산
var currentSum = 0
for i in 0...right {
    currentSum += secondInput[i]
}

var maxSum = currentSum

// 포인터 이동을 통해 최대 합 계산
while right < N - 1 {
    right += 1
    currentSum += secondInput[right]
    currentSum -= secondInput[left]
    left += 1

    maxSum = max(currentSum, maxSum)
}

print(maxSum)
