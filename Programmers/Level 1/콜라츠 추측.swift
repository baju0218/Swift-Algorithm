import Foundation

func solution(_ num:Int) -> Int {
    var answer = 0
    var n = num
    
    while n != 1 && answer < 500 {
        if n % 2 == 0 {
            n /= 2
            answer += 1
        }
        else {
            n = (3 * n + 1) / 2
            answer += 2
        }
    }
    
    if answer < 500 {
        return answer
    }
    else {
        return -1
    }
}
