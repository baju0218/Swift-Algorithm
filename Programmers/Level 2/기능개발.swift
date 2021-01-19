import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    var copiedProgresses = progresses
    var copiedSpeeds = speeds
    
    while !copiedProgresses.isEmpty {
        var count = 0
        
        while !copiedProgresses.isEmpty && copiedProgresses.first! >= 100 {
            copiedProgresses.removeFirst()
            copiedSpeeds.removeFirst()
            count += 1
        }
        
        if count != 0 {
            answer.append(count)
        }
        
        for i in 0..<copiedProgresses.count {
            copiedProgresses[copiedProgresses.index(copiedProgresses.startIndex, offsetBy: i)] += copiedSpeeds[copiedSpeeds.index(copiedSpeeds.startIndex, offsetBy: i)]
        }
    }
    
    return answer
}
