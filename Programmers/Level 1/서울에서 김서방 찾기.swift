func solution(_ seoul:[String]) -> String {
    for index in 0..<seoul.count {
        if seoul[index] == "Kim" {
            return "김서방은 \(index)에 있다"
        }
    }
    
    return ""
}
