import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    for command in commands {
        let startIndex = command[0] - 1
        let endIndex = command[1] - 1
        let middleIndex = command[2] - 1
        var copiedArray = array[startIndex...endIndex]
        
        copiedArray.sort()
        answer.append(copiedArray[copiedArray.startIndex + middleIndex])
    }
    
    return answer
}
