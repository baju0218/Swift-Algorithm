import Foundation

func GCD(a: Int, b: Int) -> Int {
    if a % b == 0 {
        return b
    }
    else {
        return GCD(a: b, b: a % b)
    }
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    let gcd = GCD(a: n, b: m)
    
    return [gcd, n * m / gcd]
}
