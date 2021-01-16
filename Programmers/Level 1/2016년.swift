func solution(_ a:Int, _ b:Int) -> String {
    let month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    var days = 0
    
    for m in 1..<a {
        days += month[m - 1]
    }
    days += b + 4
    days %= 7
    
    return week[days]
}
