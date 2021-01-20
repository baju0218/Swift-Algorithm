import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [Int]()
    var arr = s[s.index(s.startIndex, offsetBy: 2)...s.index(s.endIndex, offsetBy: -3)].replacingOccurrences(of: "},{", with: " ").split(separator: " ").map{$0.split(separator: ",").map{Int($0)!}}
    
    arr.sort{$0.count < $1.count}
    
    arr.forEach{
        answer.append(Array(Set($0).subtracting(answer)).first!)
    }
    
    return answer
}
