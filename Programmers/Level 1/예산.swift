import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var answer = 0
    var arr = d.sorted()
    var sum = 0
    
    for i in arr {
        sum += i
        answer += 1
        
        if budget == sum {
            break
        }
        else if budget < sum {
            answer -= 1
            break
        }
    }
    
    return answer
}
