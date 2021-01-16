import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var left = (3, 0)
    var right = (3, 2)
    
    for i in numbers {
        switch i {
        case 1, 4, 7:
            answer += "L"
            left = (i / 3, 0)
        case 3, 6, 9:
            answer += "R"
            right = (i / 3 - 1, 2)
        default:
            var pos = (i / 3, 1)
            if i == 0 {
                pos = (3, 1)
            }
            
            let diffL = abs(left.0 - pos.0) + abs(left.1 - pos.1)
            let diffR = abs(right.0 - pos.0) + abs(right.1 - pos.1)
            
            if diffL < diffR {
                answer += "L"
                left = pos
            }
            else if diffL > diffR {
                answer += "R"
                right = pos
            }
            else {
                if hand == "left" {
                    answer += "L"
                    left = pos
                }
                else {
                    answer += "R"
                    right = pos
                }
            }
        }
    }
    
    return answer
}
