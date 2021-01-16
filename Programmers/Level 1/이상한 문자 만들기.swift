import Foundation

func solution(_ s:String) -> String {
    var answer: String = ""
    var index = 0
    
    for c in s {
        if c == " " {
            answer += " "
            index = 0
        }
        else if index % 2 == 0 {
            answer += c.uppercased()
            index += 1
        }
        else {
            answer += c.lowercased()
            index += 1
        }
    }
    
    return answer
}
