import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var answer = 1
    var dic = [String:Int]()
    
    for cloth in clothes {
        if let temp = dic[cloth[1]] {
            dic[cloth[1]]! += 1
        }
        else {
            dic[cloth[1]] = 1
        }
    }
    
    for (a, b) in dic {
        answer *= b + 1
    }
    
    return answer - 1
}
