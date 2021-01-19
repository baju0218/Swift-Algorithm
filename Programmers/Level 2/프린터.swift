import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var answer = 0
    var count = [Int](repeating: 0, count: 11)
    
    for i in priorities {
        count[i] += 1
    }
    for i in (priorities[location] + 1)...10 {
        answer += count[i]
    }
    
    var lastIndex = priorities.count
    
    for p in stride(from: 9, to: priorities[location], by: -1) {
        if count[p] == 0 { continue }
        
        while true {
            lastIndex -= 1
            if lastIndex <= -1 {
                lastIndex = priorities.count - 1
            }
            
            if priorities[lastIndex] == p {
                break
            }
        }
    }
    
    while true {
        lastIndex += 1
        if lastIndex >= priorities.count {
            lastIndex = 0
        }
        
        if priorities[lastIndex] == priorities[location] {
            answer += 1
            
            if lastIndex == location {
                return answer
            }
        }
    }
    
    return 0
}
