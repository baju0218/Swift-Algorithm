import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var answer = arr
    var minValue = arr[0]
    var index = 0
    
    for i in 0..<arr.count {
        if minValue > arr[i] {
            minValue = arr[i]
            index = i
        }
    }
    
    answer.remove(at: index)
    
    if answer.isEmpty {
        return [-1]
    }
    else {
        return answer
    }
}
