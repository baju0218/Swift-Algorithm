import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = [Int]()
    var check = [Bool](repeating: true, count: 201)

    for i in numbers.startIndex..<numbers.endIndex {
        for j in i + 1..<numbers.endIndex {
            var sum = numbers[i] + numbers[j]
            
            if check[sum] {
                answer.append(sum)
                check[sum] = false
            }
        }
    }
    
    answer.sort()
    
    return answer
}
