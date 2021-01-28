import Foundation

var arr = [Int]()
var memo1 = [Int]()
var memo2 = [Int]()

func dp1(_ depth: Int) -> Int {
    if depth >= arr.count { return 0 }
    if memo1[depth] != -1 { return memo1[depth] }
    
    memo1[depth] = max(arr[depth] + dp1(depth + 2), dp1(depth + 1))
    
    return memo1[depth]
}

func dp2(_ depth: Int) -> Int {
    if depth >= arr.count - 1 { return 0 }
    if memo2[depth] != -1 { return memo2[depth] }
    
    memo2[depth] = max(arr[depth] + dp2(depth + 2), dp2(depth + 1))
    
    return memo2[depth]
}

func solution(_ sticker:[Int]) -> Int{
    arr = sticker
    memo1 = [Int](repeating: -1, count: arr.count + 1)
    memo2 = [Int](repeating: -1, count: arr.count + 1)
    
    return max(dp1(1), arr[0] + dp2(2))
}
