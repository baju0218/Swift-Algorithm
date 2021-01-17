import Foundation

func solution(_ phone_number:String) -> String {
    var answer = phone_number
    
    answer.replaceSubrange(answer.startIndex..<answer.index(answer.endIndex, offsetBy: -4), with: String(repeating: "*", count: answer.count - 4))
    
    return answer
}
