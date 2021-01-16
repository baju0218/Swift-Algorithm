import Foundation

func solution(_ n:Int64) -> Int64 {
    let sqrtN = Int64(sqrt(Double(n)))
    
    if sqrtN * sqrtN == n {
        return (sqrtN + 1) * (sqrtN + 1)
    }
    else {
        return -1
    }
}
