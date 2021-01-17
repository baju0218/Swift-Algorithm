import Foundation

func solution(_ x:Int) -> Bool {
    var sum = 0
    var num = x
    
    while num != 0 {
        sum += num % 10
        num /= 10
    }
    
    return x % sum == 0
}
