import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer = [String]()
    
    for i in 0..<n {
        var line = ""
        
        for j in 0..<n {
            if (arr1[i] & (1 << (n - 1 - j))) | (arr2[i] & (1 << (n - 1 - j))) != 0 {
                line += "#"
            }
            else {
                line += " "
            }
        }
        
        answer.append(line)
    }
    
    return answer
}
