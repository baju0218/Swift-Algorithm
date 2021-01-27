import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [0, 0]
    var count = s.filter{ $0 == "0" }.count
    var value = String(String(repeating: "1", count: s.count - count).count, radix: 2)
    
    answer[0] += 1
    answer[1] += count
    
    while value != "1" {
        print(value)
        
        count = value.filter{ $0 == "0" }.count
        value = String(String(repeating: "1", count: value.count - count).count, radix: 2)
        
        answer[0] += 1
        answer[1] += count
    }
    
    return answer
}
