import Foundation

class DisjointSet {
    var parent: [Int]
    var rank: [Int]
    
    init(_ n: Int) {
        parent = [Int](1...n)
        rank = [Int](repeating: 1, count: n)
    }
    
    func find(_ u: Int) -> Int {
        if (u == parent[u]) { return u }
        parent[u] = find(parent[u])
        return parent[u]
    }
    func merge (_ u: Int, _ v: Int) {
        var u = find(u)
        var v = find(v)
        
        if (u == v) { return }
        if (rank[u] > rank[v]) { swap(&u, &v) }
        parent[u] = v
        if (rank[u] == rank[v]) { rank[v] += 1 }
    }
}
