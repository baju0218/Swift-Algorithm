import Foundation

var nums = [Int]()
var diff = 0

func dfs(_ depth: Int, _ sum: Int) -> Int {
    if sum > diff {
        return 0
    }
    
    if depth == nums.count {
        if sum == diff {
            return 1
        }
        else {
            return 0
        }
    }
    
    return dfs(depth + 1, sum + 2 * nums[depth]) + dfs(depth + 1, sum)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    nums = numbers.sorted(by: >)
    diff = numbers.reduce(0, +) - target
    
    return dfs(0, 0)
}
