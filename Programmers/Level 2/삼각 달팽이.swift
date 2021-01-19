import Foundation

func solution(_ n:Int) -> [Int] {
    var answer = [Int]()
    var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    var num = 1
    for depth in 0..<(n+2)/3 {
        
        for row in 2 * depth..<n - depth {
            arr[row][depth] = num
            num += 1
        }
        
        for col in 1 + depth..<n - 2 * depth {
            arr[n - 1 - depth][col] = num
            num += 1
        }
        
        if 1 < n - 1 - 3 * depth {
            for i in 1..<n - 1 - 3 * depth {
                arr[n - 1 - depth - i][n - 1 - 2 * depth - i] = num
                num += 1
            }
        }
        
    }
    
    for row in 0..<n {
        for col in 0...row {
            answer.append(arr[row][col])
        }
    }
    
    return answer
}
