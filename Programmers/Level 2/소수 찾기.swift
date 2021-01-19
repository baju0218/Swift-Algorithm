import Foundation

var answer = [Int]()
var isVisited = [Bool](repeating: false, count: 7)

func isPrime(_ value: Int) -> Bool {
    if value < 2 {
        return false
    }
    
    for i in 2..<Int(sqrt(Double(value))) + 1 {
        if value % i == 0 {
            return false
        }
    }
    
    return true
}

func dfs(_ s: String, _ numbers: String){
    if let value = Int(s) {
        if isPrime(value) && !answer.contains(value) {
            answer.append(value)
        }
    }
    
    for i in 0..<numbers.count {
        if !isVisited[i] {
            isVisited[i] = true
            dfs(s + String(numbers[numbers.index(numbers.startIndex, offsetBy: i)]), numbers)
            isVisited[i] = false
        }
    }
}

func solution(_ numbers:String) -> Int {
    dfs("", numbers)
    
    return answer.count
}
