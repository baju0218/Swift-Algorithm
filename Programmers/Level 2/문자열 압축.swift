import Foundation

func solution(_ s:String) -> Int {
    var answer = s.count
    
    for len in 1...max(1, s.count / 2) {
        var resultString = ""
        var token = ""
        var count = 1
        
        for i in stride(from: 0, to: s.count, by: len) {
            let nextToken = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: min(i + len, s.count))]
            
            if token == nextToken {
                count += 1
            }
            else if token != nextToken {
                if count == 1 {
                    resultString += token
                }
                else {
                    resultString += String(count) + token
                }
                
                token = String(nextToken)
                count = 1
            }
        }
        
        if count == 1 {
            resultString += token
        }
        else {
            resultString += String(count) + token
        }
        
        answer = min(answer, resultString.count)
    }
    
    return answer
}
