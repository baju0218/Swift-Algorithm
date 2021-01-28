import Foundation

var distance = 0
var visited = [Bool](repeating: false, count: vertex.count)
var priorityQueue = PriorityQueue<T>(ascending: true)

priorityQueue.push(T(vertex: 0, edge: 0))
while !priorityQueue.isEmpty {
    let front = priorityQueue.pop()!
    
    if (visited[front.vertex]) { continue }
    visited[front.vertex] = true
    
    distance += front.edge
}
