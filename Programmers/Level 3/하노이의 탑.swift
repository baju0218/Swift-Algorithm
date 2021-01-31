import Foundation

var answer = [[Int]]()

func top(_ n:Int, _ from: Int, _ middle: Int, _ to: Int) {
    if n == 1 {
        answer.append([from, to])
        return
    }
    
    top(n - 1, from, to, middle)
    answer.append([from, to])
    top(n - 1, middle, from, to)
}

func solution(_ n:Int) -> [[Int]] {
    top(n, 1, 2, 3)
    
    return answer
}
