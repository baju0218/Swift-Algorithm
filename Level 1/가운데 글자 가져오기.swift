import Foundation

func solution(_ s:String) -> String {
    let startIndex = s.index(s.startIndex, offsetBy: (s.count + 1) / 2 - 1)
    let endIndex = s.index(s.startIndex, offsetBy: s.count / 2)
    
    return String(s[startIndex...endIndex])
}
