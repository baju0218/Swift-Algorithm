import Foundation

var array = [[Int]]()

func dfs(_ r: Int, _ c: Int, _ n: Int) -> (Int, Int) {
    if n == 1 {
        if array[r][c] == 0 {
            return (1, 0)
        }
        else {
            return (0, 1)
        }
    }
    
    var area1 = dfs(r, c, n / 2)
    var area2 = dfs(r, c + n / 2, n / 2)
    var area3 = dfs(r + n / 2, c, n / 2)
    var area4 = dfs(r + n / 2, c + n / 2, n / 2)
    
    var area = (area1.0 + area2.0 + area3.0 + area4.0, area1.1 + area2.1 + area3.1 + area4.1)
    
    if area.0 == 0 && area.1 == 4 {
        return (0, 1)
    }
    else if area.0 == 4 && area.1 == 0 {
        return (1, 0)
    }
    else {
        return area
    }
}

func solution(_ arr:[[Int]]) -> [Int] {
    array = arr
    
    var answer = dfs(0, 0, arr.count)
    
    return [answer.0, answer.1]
}

print(solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]))
