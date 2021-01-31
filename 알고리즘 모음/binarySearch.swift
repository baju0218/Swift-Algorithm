import Foundation

func binarySearch(_ left: Int, _ right: Int) -> Int {
    if left >= right { return right - 1 }

    let mid = (left + right) / 2

    var cnt = cut
    
    var pos = 0
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

var arr = [Int]()
var cut = 0

binarySearch(0, length)
