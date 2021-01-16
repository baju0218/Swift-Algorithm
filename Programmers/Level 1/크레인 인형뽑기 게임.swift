import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    var copiedBoard = board
    var basket = [Int]()
    let copiedMoves = moves.map{ $0 - 1 }
    let N = board.count
    
    for col in copiedMoves {
        var selected = 0
        
        for row in 0..<N {
            if copiedBoard[row][col] != 0 {
                selected = copiedBoard[row][col]
                copiedBoard[row][col] = 0
                
                break
            }
        }
        
        if selected != 0 {
            if !basket.isEmpty && basket.last == selected {
                basket.removeLast()
                answer += 2
            }
            else {
                basket.append(selected)
            }
        }
    }
    
    return answer
}
