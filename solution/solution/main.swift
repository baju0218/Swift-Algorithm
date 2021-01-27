// Quiz 2-8
var arr = [Int?](repeating: nil, count: 10).map(  )


arr.append(Int.random(in: 0...11)).map{
    if $0 == 11 { return nil }
    else { return $0 }
}
