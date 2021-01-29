import Foundation

var arr = [Int]()
var end = 0
var put = 0

func binarySearch(_ left: Int, _ right: Int) -> Int {
    if left >= right { return right - 1 }

    let mid = (left + right) / 2

    var pos = 0
    var cnt = put
    
    for i in 0..<arr.count {
        if arr[i] - pos >= mid  {
            pos = arr[i]
            cnt -= 1
        }
    }
    if end - pos < mid { cnt += 1 }
    
    if cnt > 0 { return binarySearch(left, mid) }
    else { return binarySearch(mid + 1, right) }
}

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    arr = rocks.sorted()
    end = distance
    put = rocks.count - n
    
    return binarySearch(0, distance)
}
