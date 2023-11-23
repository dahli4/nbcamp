import UIKit
// 옵셔널
/* 옵셔널은 안전성을 높이기 위해 사용되는 개념. nil을 사용할 수 있는 타입과 사용할 수 없는 타입으로 구분
 사용할 수 없는 타입을 옵셔널 타입이라고 부른다. 모든 타입이 nil을 반환할 수 있는건 아니고 옵셔널 타입만 가능. 
 중요한 것은 -오류가 발생할 가능성- 조금이라도 발생할 가능성이 있다면 모두 옵셔널 타입으로 정의해야 함.*/
let num = Int("123")
let num2 = Int("Swift")
Int("123")
Int("Swift")

//옵셔널 타입 선언과 정의 -> 일반 자료형뒤에 ?를 붙이면 옵셔널 자료형이 된다.
var optInt: Int?
optInt = 3
var optStr: String?
optStr = "Swift"
var optDouble: Double?
optDouble = 5.5
var optArr: [String]?
optArr = ["c","Java","Swift"]
var optDic: Dictionary<String, Int>?
optDic = ["국어": 94, "수학": 20, "영어": 50]
var optDic2: [String: String]?
var optClass: AnyObject?

//옵셔널 값 처리
//옵셔널 타입은 연산을 지원하지 않음.

var optInt2: Int? = 3
//print("옵셔널 자체의 값: \(optInt2)")
