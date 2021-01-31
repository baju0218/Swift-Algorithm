import Foundation

class DisjointSet {
    var parent: [Int]
    var rank: [Int]
    
    init(_ n: Int) {
        parent = [Int](0...n)
        rank = [Int](repeating: 1, count: n + 1)
    }
    
    func find(_ u: Int) -> Int {
        if (u == parent[u]) { return u }
        parent[u] = find(parent[u])
        return parent[u]
    }
    func merge (_ u: Int, _ v: Int) {
        var U = find(u)
        var V = find(v)
        
        if (U == V) { return }
        if (rank[U] > rank[V]) { swap(&U, &V) }
        parent[U] = V
        if (rank[U] == rank[V]) { rank[V] += 1 }
    }
}

struct Node {
    let a: Int
    let b: Int
    let distance: Int
}

extension Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.distance < rhs.distance
    }
    
    static func > (lhs: Node, rhs: Node) -> Bool {
        return lhs.distance > rhs.distance
    }
}

public struct PriorityQueue<T: Comparable> {
    private var heap = [T]()
    private let ordered: (T, T) -> Bool
    
    public init(ascending: Bool = false, startingValues: [T] = []) {
        if ascending { ordered = { $0 > $1 } }
        else { ordered = { $0 < $1 } }
        heap = startingValues
        var i = (heap.count / 2) - 1
        while i >= 0 {
            sink(i)
            i = i - 1
        }
    }
    
    public var count: Int { return heap.count }
    
    public var isEmpty: Bool { return heap.isEmpty }
    
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    public mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeFirst() }
        heap.swapAt(0, heap.count - 1)
        let temp = heap.removeLast()
        sink(0)
        return temp
    }
    
    public mutating func remove(_ item: T) {
        if let index = heap.index(of: item) {
            heap.swapAt(index, heap.count - 1)
            heap.removeLast()
            swim(index)
            sink(index)
        }
    }
    
    public mutating func removeAll(_ item: T) {
        var lastCount = heap.count
        remove(item)
        while heap.count < lastCount {
            lastCount = heap.count
            remove(item)
        }
    }
    
    public func peek() -> T? { return heap.first }
    
    public mutating func clear() { heap.removeAll(keepingCapacity: false) }
    
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1
            if j < (heap.count - 1) && ordered(heap[j], heap[j + 1]) { j = j + 1 }
            if !ordered(heap[index], heap[j]) { break }
            heap.swapAt(index, j)
            index = j
        }
    }
    
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var answer = 0
    
    var ds = DisjointSet(n)
    var pq = PriorityQueue(ascending: true, startingValues: costs.map{ Node(a: $0[0], b: $0[1], distance: $0[2]) })
    
    while !pq.isEmpty {
        let front = pq.pop()!
        
        if ds.find(front.a) != ds.find(front.b) {
            ds.merge(front.a, front.b)
            answer += front.distance
        }
    }
    
    return answer
}
