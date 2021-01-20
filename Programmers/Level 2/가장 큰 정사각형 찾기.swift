import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer = 0
    var map = board
    var row = board.count
    var col = board.first!.count
    
    for i in 0..<row {
        for j in 0..<col {
            if i == 0 || j == 0 {
                continue
            }
            if map[i][j] != 0 {
                map[i][j] = min(map[i - 1][j - 1], min(map[i - 1][j], map[i][j - 1])) + 1
            }
        }
    }
    
    var n = map.reduce(0, { max($0, $1.max()!) })
    
    return n * n
}
