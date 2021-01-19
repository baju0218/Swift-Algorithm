import Foundation

func GCD(_ a: Int64, _ b: Int64) -> Int64 {
    if a % b == 0 {
        return b
    }
    return GCD(b, a % b)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer: Int64 = 0
    let width = Int64(w)
    let height = Int64(h)
    let gcd = GCD(width, height)
    let a = max(width, height) / gcd
    let b = min(width, height) / gcd
    
    if b == 1 {
        answer = a
    }
    else {
        answer += (a / b + 1) * b + a % b - 1
    }
    
    return width * height - gcd * answer
}
