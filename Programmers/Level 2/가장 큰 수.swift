import Foundation

func compare(_ str1: String, _ str2: String) -> Bool {
    return str1 + str2 > str2 + str1
}

func solution(_ numbers:[Int]) -> String {
    var answer = numbers.map{ String($0) }.sorted{ compare($0, $1) }
    
    while Int(answer.first!)! == 0 {
        answer.removeFirst()
        
        if answer.isEmpty {
            return "0"
        }
    }
    
    return answer.reduce("", +)
}
