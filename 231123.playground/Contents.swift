import UIKit

//옵셔널 강제 해제 -> 옵셔널 타입의 값 뒤에 "!"만 붙여주면 된다. 강제 해제 연산자

var optInt: Int? = 3

print("옵셔널 자체의 값: \(optInt)")
print("!로 강제 해제한 값: \(optInt!)")

//옵셔널 자체의 값은 Optional()로 감싸짐 강제 해제하면 내부 값 추출

Int("123")! + Int("123")!
Int("123")! + 30

//nil일때 !를 사용하면 오류 발생. 옵셔널 값이 nil인지 체크 필요

var str = "123"
var intFromStr = Int(str)

if intFromStr != nil{
    print("\(intFromStr!)")
} else{
    print("fail")
}

// 변환 불가능한 값
var str2 = "swift"
var intFromStr2 = Int(str2)

if intFromStr2 != nil{
    print("\(intFromStr2!)")
} else{
    print("fail")
}
//입력된 문자열은 숫자로 변환 불가능 intFromStr2 -> nil
/*
 infFromStr과 nil 사이에 != 연산자 앞뒤로 공백이 있는데 오류 방지를 위한 목적이다
 intFromStr!=nil
 (intFromStr)!=(nil)
 (intFromStr!)=nil
 이런 해석의 차이가 발생할 가능성이 있으니 공백을 주어야 한다!
 */


//옵셔널 바인딩 -> 비강제적인 해제 구문

var str3 = "Swift"

if let intFromStr3 = Int(str3){
    print("\(intFromStr3)")
} else{
    print("fail")
}

func intStr(str: String){
    guard let intFromStr = Int(str3) else{
        print("Fail")
        return
    }
    print("\(intFromStr)")
}
intStr(str: "반환")
// 자료에선 함수 호출이 없어서 결과가 안나왔다. 함수는 다음 챕터...


//컴파일러에 의한 자동 옵셔널 해제

let optInt22 = Int("123")
if (optInt22 == 123){
    print("123")
} else{
    print("no")}
// 강제 해제하지 않은 옵셔널 값은 정수123과 다른데 비교연산자를 사용하는 경우엔 자동으로 옵셔널을 해제하기 때문!
