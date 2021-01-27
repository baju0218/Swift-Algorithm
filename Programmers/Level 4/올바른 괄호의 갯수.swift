import Foundation

var memo = [[Int]](repeating: [Int](repeating: -1, count: 29), count: 29)

func dp(_ a: Int, _ b: Int) -> Int {
    if a < 0 { return 0 }
    if b == 0 { return a == 0 ? 1 : 0 }
    
    if memo[a][b] != -1 { return memo[a][b] }
    
    memo[a][b] = dp(a + 1, b - 1) + dp(a - 1, b - 1)
    
    return memo[a][b]
}

func solution(_ n: Int) -> Int {
    return dp(1, 2 * n - 1)
}