import Foundation

var memo = [[Int]]()

func dp(_ row: Int, _ col: Int, _ land:[[Int]]) -> Int {
    if row == land.count { return 0 }
    if memo[row][col] != -1 { return memo[row][col] }
    
    var answer = 0
    
    for j in 0..<4 {
        if j != col {
            answer = max(answer, dp(row + 1, j, land) + land[row][col])
        }
    }
    
    memo[row][col] = answer
    
    return answer
}

func solution(_ land:[[Int]]) -> Int{
    memo = [[Int]](repeating: [Int](repeating: -1, count: 4), count: land.count)
    
    var answer = 0

    for j in 0..<4 {
        answer = max(answer, dp(0, j, land))
    }
    
    return answer
}
