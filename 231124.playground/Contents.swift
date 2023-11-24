import UIKit

//옵셔널의 묵시적 해제는 ? 연산자 대신 ! 연산자만 붙여주면 된다.

//명시적 옵셔널
var str: String? = "swift"
print(str)

//묵시적 옵셔널
var str2: String! = "swift"
print(str2)


//nil을 대입해도 문제가 없다!
var str3: String! = nil

//var value01: Int? = 10
//value01 + 5

var value02: Int! = 10
value02 + 5
