import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var answer = [Int]()
    var temp = brown / 2 - 2
    
    for i in 1...temp / 2 {
        if i * (temp - i) == yellow {
            answer.append(max(i, temp - i) + 2)
            answer.append(min(i, temp - i) + 2)
        }
    }
    
    return answer
}
