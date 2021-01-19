import Foundation

func dfs(_ index: Int, _ make: String, _ name: String) -> Int {
    var asciiValue = Int(name[name.index(name.startIndex, offsetBy: index)].asciiValue!) - 65
    var count = min(asciiValue, 26 - asciiValue)
    var current = make
    current.remove(at: current.index(current.startIndex, offsetBy: index))
    current.insert(name[name.index(name.startIndex, offsetBy: index)], at: current.index(current.startIndex, offsetBy: index))
    
    if current == name {
        return count
    }
    else {
        var rightIndex = (index + 1) % name.count
        var rightMove = 1
        var leftIndex = (index + name.count - 1) % name.count
        var leftMove = 1
        
        while current[current.index(current.startIndex, offsetBy: rightIndex)] == name[name.index(name.startIndex, offsetBy: rightIndex)] {
            rightIndex += 1
            rightIndex %= name.count
            rightMove += 1
        }
        
        while current[current.index(current.startIndex, offsetBy: leftIndex)] == name[name.index(name.startIndex, offsetBy: leftIndex)] {
            leftIndex += name.count - 1
            leftIndex %= name.count
            leftMove += 1
        }
        
        return min(dfs(rightIndex, current, name) + rightMove, dfs(leftIndex, current, name) + leftMove) + count
    }
}

func solution(_ name:String) -> Int {
    return dfs(0, String(repeating: "A", count: name.count), name)
}
