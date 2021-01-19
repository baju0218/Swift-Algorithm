import Foundation

func check(_ p: String) -> Bool {
    var index = -1
    var count = 0
    repeat {
        index += 1
        
        if p[p.index(p.startIndex, offsetBy: index)] == "(" { count += 1 }
        else { count -= 1 }
        
        if count < 0 {
            return false
        }
    }
    while count == 0
    
    return true
}

func convert(_ p: String) -> String {
    var result = ""
    
    for c in p {
        if c == "(" {
            result += ")"
        }
        else {
            result += "("
        }
    }
    
    if !result.isEmpty {
        result.removeFirst()
        result.removeLast()
    }
    
    return result
}

func solution(_ p:String) -> String {
    if p.isEmpty {
        return p
    }
    
    var index = -1
    var count = 0
    repeat {
        index += 1
        
        if p[p.index(p.startIndex, offsetBy: index)] == "(" { count += 1 }
        else { count -= 1 }
    }
    while count != 0
    
    var u = String(p[p.startIndex...p.index(p.startIndex, offsetBy: index)])
    var v = String(p[p.index(p.startIndex, offsetBy: index + 1)..<p.endIndex])
    
    if check(u) {
        return u + solution(v)
    }
    else {
        return "(" + solution(v) + ")" + convert(u)
    }
}
