import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    
    for index in 0..<a.count {
        answer += a[index] * b[index]
    }
    
    return answer
}
