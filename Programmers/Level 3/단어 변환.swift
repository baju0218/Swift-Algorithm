import Foundation

var visited: [String:Bool] = [:]

func diff(_ a: String, _ b: String) -> Int {
    var result = 0
    
    for i in 0..<a.count {
        if a[a.index(a.startIndex, offsetBy: i)] != b[b.index(b.startIndex, offsetBy: i)] {
            result += 1
        }
    }
    
    return result
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    for s in words {
        visited[s] = false
    }
    
    var depth = 0
    var q = [begin]
    
    while !q.isEmpty {
        let cnt = q.count
        
        for _ in 0..<cnt {
            let front = q.removeFirst()
            
            if diff(front, target) == 0 {
                return depth
            }
            else {
                for s in words {
                    if !visited[s]! && diff(front, s) == 1 {
                        visited[s] = true
                        q.append(s)
                    }
                }
            }
        }
        
        depth += 1
    }
    
    return 0
}
