import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    let sum = a + b
    let cnt = abs(a - b) + 1
    
    return Int64(sum * cnt / 2)
}
