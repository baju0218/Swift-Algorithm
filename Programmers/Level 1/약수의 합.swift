import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 {
        return 0
    }
    else {
        return [Int](1...n).filter{ n % $0 == 0 }.reduce(0, +)
    }
}
