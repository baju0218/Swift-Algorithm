import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var answer = [Int]()
    let players = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    var counts = [Int](repeating: 0, count: 3)
    
    for answerIndex in 0..<answers.count {
        for playerIndex in 0..<3 {
            if players[playerIndex][answerIndex % players[playerIndex].count] == answers[answerIndex] {
                counts[playerIndex] += 1
            }
        }
    }
    
    for playerIndex in 0..<3 {
        if counts[playerIndex] == counts.max() {
            answer.append(playerIndex + 1)
        }
    }
    
    return answer
}
