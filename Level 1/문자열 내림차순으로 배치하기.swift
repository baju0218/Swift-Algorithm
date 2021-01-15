import Foundation

func solution(_ s:String) -> String {
    var answer = s.sorted{ $0 > $1 }
    
    return String(answer)
}
