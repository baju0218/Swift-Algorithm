import Foundation

let div: Int64 = 10000019

// Combination
var comb = [[Int64]](repeating: [Int64](repeating: 0, count: 301), count: 301)

func combination(_ n: Int, _ r: Int) -> Int64 {
    if n < r { return 0 }
    
    if n == r || r == 0 { return 1 }
    
    if comb[n][r] != 0 { return comb[n][r] }
    
    comb[n][r] = (combination(n - 1, r - 1) + combination(n - 1, r)) % div
    
    return comb[n][r]
    
}

// DP
var row = 0
var col = 0
var cnt = [Int]()

var memo = [[Int]]()

func dp(_ depth: Int, _ odd: Int) -> Int {
    if depth == col { return odd == 0 ? 1 : 0 }
    if memo[depth][odd] != -1 { return memo[depth][odd] }
    
    var result: Int64 = 0
    
    let minOverlap = odd + cnt[depth] > row ? odd + cnt[depth] - row : 0
    let maxOverlap = min(odd, cnt[depth])
    
    for overlap in minOverlap...maxOverlap {
        let putOnOdd = combination(odd, overlap)
        let putOnEven = combination(row - odd, cnt[depth] - overlap)
        let nextCase = Int64(dp(depth + 1, odd + cnt[depth] - overlap * 2))
        
        result += (putOnOdd * putOnEven % div) * nextCase % div
    }
    
    memo[depth][odd] = Int(result % div)
    
    return memo[depth][odd]
}

func solution(_ a:[[Int]]) -> Int {
    row = a.count
    col = a[0].count
    cnt = [Int](repeating: 0, count: col)
    
    memo = [[Int]](repeating: [Int](repeating: -1, count: row + 1), count: col)
    
    for i in 0..<a.count {
        for j in 0..<a[i].count {
            if a[i][j] == 1 { cnt[j] += 1 }
        }
    }
    
    return dp(0, 0)
}
