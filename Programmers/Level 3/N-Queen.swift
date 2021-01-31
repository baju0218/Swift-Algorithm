import Foundation

var board = [Int]()

func check(_ row: Int, _ col: Int) -> Bool {
    for i in 0..<row {
        if row - i == col - board[i] || board[i] == col || row - i == board[i] - col { return false }
    }
    
    return true
}

func dfs(_ row: Int) -> Int {
    if row == board.count { return 1 }
    
    var result = 0
    
    for col in 0..<board.count {
        if check(row, col) {
            board[row] = col
            result += dfs(row + 1)
        }
    }
    
    return result
}

func solution(_ n:Int) -> Int {
    board = [Int](repeating: -1, count: n)
    
    return dfs(0)
}
