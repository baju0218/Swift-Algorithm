import Foundation

func solution(_ dartResult:String) -> Int {
    var arr = [Int]()
    var beforeChar = Character(" ")
    
    for char in dartResult {
        switch char {
        case "S":
            arr[arr.endIndex - 1] *= 1
        case "D":
            arr[arr.endIndex - 1] *= arr[arr.endIndex - 1]
        case "T":
            arr[arr.endIndex - 1] *= arr[arr.endIndex - 1] * arr[arr.endIndex - 1]
        case "*":
            if arr.count > 1 {
                arr[arr.endIndex - 2] *= 2
            }
            arr[arr.endIndex - 1] *= 2
        case "#":
            arr[arr.endIndex - 1] *= -1
        default:
            let value = Int(String(char))!
            
            if value == 0 && beforeChar == "1" {
                arr[arr.endIndex - 1] = 10
            }
            else {
                arr.append(value)
            }
        }
        
        beforeChar = char
    }
    
    return arr.reduce(0, +)
}
