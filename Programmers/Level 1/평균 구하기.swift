import Foundation

func solution(_ arr:[Int]) -> Double {
    var answer = 0.0
    
    for i in arr {
        answer += Double(i)
    }
    
    return answer / Double(arr.count)
}
