import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var arr = number.map{Int(String($0))!}
    var ans = [Int]()
    
    var cnt = k
    
    for i in arr {
        while !ans.isEmpty && ans.last! < i && cnt != 0 {
            ans.removeLast()
            cnt -= 1
        }
        
        ans.append(i)
    }
    
    ans.removeLast(cnt)
    
    return ans.map{String($0)}.reduce("", + )
}
