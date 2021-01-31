import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var answer = 0
    var input = jobs.sorted{ $0[0] < $1[0] }
    var stack = [[Int]]()
    var time = 0
    
    while true {
        if stack.isEmpty && !input.isEmpty {
            time = input.first![0]
            
            while !input.isEmpty && input.first![0] == time { stack.append(input.removeFirst()) }
        }
        if stack.isEmpty { break }
        
        stack.sort{ $0[1] < $1[1] }
        
        let front = stack.removeFirst()
        
        answer += front[1] * (stack.count + 1)
        time += front[1]
        
        while !input.isEmpty && input.first![0] <= time {
            answer += time - input.first![0]
            stack.append(input.removeFirst())
        }
    }
    
    return answer / jobs.count
}
