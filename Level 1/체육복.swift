import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var answer = 0
    var clothes = [Int](repeating: 1, count: n)
    
    for i in lost {
        clothes[i - 1] -= 1
    }
    
    for i in reserve {
        clothes[i - 1] += 1
    }
    
    for i in 0..<n {
        if clothes[i] == 0 {
            if i != 0 && clothes[i - 1] == 2 {
                clothes[i - 1] = 1
                clothes[i] = 1
            } else if i != n - 1 && clothes[i + 1] == 2 {
                clothes[i] = 1
                clothes[i + 1] = 1
            }
        }
    }
    
    for i in 0..<n {
        if clothes[i] >= 1 {
            answer += 1
        }
    }
    
    return answer
}
