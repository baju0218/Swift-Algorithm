import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    var three = [Int]()
    var number = n
    
    while number != 0 {
        three.append(number % 3)
        number /= 3
    }
    
    number = 1
    
    for i in three.reversed() {
        answer += i * number
        number *= 3
    }
    
    return answer
}
