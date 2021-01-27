import Foundation

func solution(_ n:Int) -> Int {
    var answer = ""
    var binary = String(n, radix: 2).map{ $0 }
    
    var index = binary.count - 1
    while index != 0 {
        if binary[index - 1] == "0" && binary[index] == "1" { break }
        index -= 1
    }
    
    if index != 0 {
        binary.swapAt(index - 1, index)
        
        let one = binary[index + 1..<binary.count].filter{ $0 == "1" }.count
        
        answer = String(binary[0...index]) + String(repeating: "0", count: binary.count - index - 1 - one) + String(repeating: "1", count: one)
    }
    else {
        let one = binary.filter{ $0 == "1" }.count
        
        answer = "1" + String(repeating: "0", count: binary.count - one + 1) + String(repeating: "1", count: one - 1)
    }
    
    return Int(answer, radix: 2)!
}
