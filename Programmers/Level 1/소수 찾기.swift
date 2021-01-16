import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    var check = [Bool](repeating: true, count: n + 1)
    check[0] = false
    check[1] = false
    
    for i in 2...Int(sqrt(Double(n))) + 1 {
        for j in stride(from: i * 2, to: n + 1, by: i) {
            check[j] = false
        }
    }
    
    for i in 1...n {
        if check[i] {
            answer += 1
        }
    }
    
    return answer
}
