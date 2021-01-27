func solution(_ s:String) -> String {
    var answer = s.split(separator: " ").map{ Int(String($0))! }
    
    return "\(answer.min()!) \(answer.max()!)"
}
