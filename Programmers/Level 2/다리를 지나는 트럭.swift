import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var weights = [Int]()
    var times = [Int]()
    
    var total = 0
    var time = 0
    
    for i in 0..<truck_weights.count {
        let w = truck_weights[i]
        
        while total + w > weight {
            total -= weights.removeFirst()
            time = max(time, times.removeFirst())
        }
        
        total += w
        time += 1
        
        weights.append(w)
        times.append(time + bridge_length - 1)
    }
    
    return times.last! + 1
}
