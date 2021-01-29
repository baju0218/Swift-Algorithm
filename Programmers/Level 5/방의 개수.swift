import Foundation

var dx = [-1,-1,0,1,1,1,0,-1]
var dy = [0,1,1,1,0,-1,-1,-1]

func solution(_ arrows:[Int]) -> Int {
    var answer = 0
    
    var x = 0
    var y = 0
    var minX = 0
    var minY = 0
    var maxX = 0
    var maxY = 0
    
    for i in arrows {
        x += dx[i]
        y += dy[i]
        minX = min(x, minX)
        minY = min(y, minY)
        maxX = max(x, maxX)
        maxY = max(y, maxY)
    }
    
    var map = [[[Int]]](repeating: [[Int]](repeating: [Int](), count: maxY - minY + 2), count: maxX - minX + 2)
    
    x = -minX
    y = -minY
       
    for i in arrows {
        // 이전의 점에 방향 추가
        map[x][y].append(i)
        
        // 현재 점으로 이동
        x += dx[i]
        y += dy[i]
        
        // case : 첫 방문일때
        if map[x][y].isEmpty {
            // 현재 점에 왔던 방향 추가
            map[x][y].append((i + 4) % 8)
        }
        // case : 지난적이 있을 때
        else {
            // 경로 그대로일 때(방 생성x)
            if map[x][y].contains((i + 4) % 8) {
                continue
            }
            // 새 경로일 때(방 생성o)
            else {
                answer += 1
                map[x][y].append((i + 4) % 8)
            }
        }
        
        // case : 대각선으로 만날 때(방 생성o)
        switch i {
        case 1:
            if map[x][y - 1].contains(3) { answer += 1 }
        case 3:
            if map[x - 1][y].contains(5) { answer += 1 }
        case 5:
            if map[x - 1][y].contains(3) { answer += 1 }
        case 7:
            if map[x][y + 1].contains(5) { answer += 1 }
        default:
            continue
        }
    }
    
    return answer
}
