import Foundation

func solution(_ s:String) -> Bool {
    var answer = false
    var p = 0
    var y = 0
    
    for c in s {
        if c == "p" || c == "P" {
            p += 1
        }
        else if c == "y" || c == "Y" {
            y += 1
        }
    }
    
    answer = p == y

    return answer
}
