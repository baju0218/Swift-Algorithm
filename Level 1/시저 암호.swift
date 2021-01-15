import Foundation

func solution(_ s:String, _ n:Int) -> String {
    var answer:String = ""
    
    for char in s.utf8 {
        let ascii = Int(char)
        
        switch ascii {
        case 65...90:
            answer += String(Character(Unicode.Scalar.init((ascii - 65 + n) % 26 + 65)!))
        case 97...122:
            answer += String(Character(Unicode.Scalar.init((ascii - 97 + n) % 26 + 97)!))
        default:
            answer += " "
        }
    }
    
    return answer
}
