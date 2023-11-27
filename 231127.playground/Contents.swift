import UIKit

var greeting = "Hello, playground"

var x = 10
var y = 20

var sum: Int{
    get{
        return x + y
    }
    set{
        sum = x + y
    }
}
print(sum)

var sum1: Int{
    return x+y
}

var sum2: Int{
    x+y
}

//func 함수_이름(아규먼트_레이블: 파라미터_타입) -> 리턴타입{
//    코드
//}

func sayHi(friend: String){
    print("Hi~\(friend)")
}
sayHi(friend: "영호")

func sayHi(to friend: String){ //to : 아규먼트 레이블 호출할 때 사용
    print("Hi~ \(friend)")
}
sayHi(to: "영호")

func sayHi(_ friend: String) -> String{ // _ : 호출하는 쪽에서 안적어줘도 된다.
    return("Hi~ \(friend)")
}
print(sayHi("영호"))


//정상 몸무게 = (키-100) * (9/10) 이라고 할 때
//특정 키에 알맞은 몸무게 구하기
func getWeight(height: Int) -> Double{
    let weight = (height-100)*9/10
    return Double(weight)
}
//특정 몸무게에 알맞은 키 구하기
func getHeight(weight: Int) -> Double{
    let height = weight * 10/9 + 100
    return Double(height)
}

var anyArray: [Any] = [1,"Hi",true]

var anyValue: Any = 10
anyValue = "어떤 타입도 가능"
anyValue = 12345.67

let cookieCount = 62
let message: String
switch cookieCount {
case 0:
    message = "no cookie"
case 1..<5:
    message = "cookie"
case 5..<12:
    message = "coookie"
case 12..<100:
    message = "cooooookie"
case 100..<10000:
    message = "cooooooooooookie"
default:
    message = "cook"
}

//fallthrough 해당 케이스의 구문이 실행된 이후에도 무조건 다음블럭을 실행

