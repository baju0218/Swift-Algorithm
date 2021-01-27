import Foundation

var board = [[Int]]()
var h = 0

var visited = [[Bool]]()
var priorityQueue = PriorityQueue<Node>(ascending: true)

let dx = [ -1, 0, 1, 0 ]
let dy = [ 0, 1, 0, -1 ]
var nextX = 0
var nextY = 0

struct Node {
    let row: Int
    let col: Int
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

func check(_ row: Int, _ col: Int) -> Bool {
    return row >= 0 && row < board.count && col >= 0 && col < board[0].count
}

func dfs(_ row: Int, _ col: Int) {
    visited[row][col] = true

    for i in 0..<4 {
        nextX = row + dx[i]
        nextY = col + dy[i]
        
        if check(nextX, nextY) && !visited[nextX][nextY] {
            if abs(board[row][col] - board[nextX][nextY]) <= h {
                dfs(nextX, nextY)
            }
            else {
                priorityQueue.push(Node(row: nextX, col: nextY, distance: abs(board[row][col] - board[nextX][nextY])))
            }
        }
    }
}

func solution(_ land:[[Int]], _ height:Int) -> Int {
    board = land
    h = height
    
    visited = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
    priorityQueue.push(Node(row: 0, col: 0, distance: 0))
    
    var answer = 0
    
    while !priorityQueue.isEmpty {
        let front = priorityQueue.pop()!
        
        if (visited[front.row][front.col]) { continue }
        
        dfs(front.row, front.col)
        answer += front.distance
    }
    
    return answer
}
