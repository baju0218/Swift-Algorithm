import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var counting = [Int](repeating: 0, count: N + 2)
    var failureRate = [(Double, Double)]()
    var sum = stages.count
    
    for i in stages {
        counting[i] += 1
    }
    
    for i in 1...N {
        failureRate.append((Double(i), Double(counting[i]) / Double(sum)))
        sum -= counting[i]
    }
    
    return failureRate.sorted(by: {$0.1 > $1.1}).map({Int($0.0)})
}
