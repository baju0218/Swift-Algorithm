import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    
    for skill_tree in skill_trees {
        var reduce_skill_tree = skill_tree.filter{ skill.contains($0) }
        var isPossible = true
        
        print(reduce_skill_tree)
        
        for i in 0..<reduce_skill_tree.count {
            if skill[skill.index(skill.startIndex, offsetBy: i)] != reduce_skill_tree[reduce_skill_tree.index(reduce_skill_tree.startIndex, offsetBy: i)] {
                isPossible = false
                break
            }
        }
        
        if isPossible {
            answer += 1
        }
    }
    
    return answer
}
