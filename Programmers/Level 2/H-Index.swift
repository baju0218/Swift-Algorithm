import Foundation

func solution(_ citations:[Int]) -> Int {
    var answer = 0
    var c = citations.sorted()
    var h: Int
    
    var num = -1
    for i in 0..<c.count {
        if num != c[i] {
            num = c[i]
            
            h = min(c.count - i, c[i])
            
            if i <= h {
                answer = max(answer, h)
            }
        }
    }
    
    return answer
}
