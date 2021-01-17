import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    if x == 0 {
        return [Int64](repeating: 0, count: n)
    }
    else {
        return [Int64](stride(from: Int64(x), through: Int64(x * n), by: Int64.Stride(Int64(x))))
    }
}
