import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var edge = [[Int]](repeating: [Int](), count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    
    for i in edge {
        edge[i[0]].append(i[1])
        edge[i[1]].append(i[0])
    }
    
    var stack = [1]
    visited[1] = true
    
    while true {
        let count = stack.count
        
        for _ in 0..<count {
            let front = stack.removeFirst()
            
            for vertex in edge[front] {
                if !visited[vertex] {
                    stack.append(vertex)
                    visited[vertex] = true
                }
            }
        }
        
        if stack.isEmpty { return count }
    }
}
