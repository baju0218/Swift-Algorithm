import Foundation

func solution(_ s:String) -> Bool {
    if (s.count == 4 || s.count == 6) {
        for i in s {
            if i.isLetter {
                return false
            }
        }
        
        return true
    }
    
    return false
}
