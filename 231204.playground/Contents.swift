import UIKit

//didSet은 새 값이 저장된 직후에 호출
//이전 프로퍼티의 값이 oldValue로 제공

//willSet은 값이 저장되기 직전에 호출
//새로운 프로퍼티의 값이 newValue로 제공

var myProperty: Int = 20{
    didSet(oldValue){
        
    }
    willSet(newValue){
        
    }
}

var name: String = "Unknown"{
    willSet{
        print("현재 이름 = \(name), 바뀔 이름 = \(newValue)")
    }
    didSet{
        print("now = \(name), before = \(oldValue)")
    }
}
name = "Peter"


class userAccount {
    var username: String
    var password: String
    var loginAttempts: Int = 0{
        didSet{
            if loginAttempts >= 3 {
                print("로그인 시도가 3회 이상 실패. 계정 잠금")
                lockAccount()
            }
        }
    }
    var isLocked: Bool = false{
        didSet{
            if isLocked{
                print("lock")
            }else{
                print("unlock")
            }
        }
    }
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    func login(with enterPassword: String){
        if enterPassword == password{
            print("login")
            loginAttempts = 0 //로그인 성공 시 시도 횟수 초기화
        }else{
            print("fail")
            loginAttempts += 1 //로그인 실패 카운트 증가
        }
    }
    private func lockAccount(){
        isLocked = true
    }
    func unlockAccount(){
        isLocked = false
    }
}
//계정생성
let user = userAccount(username: "Kim", password: "pass123")
//로그인 시도
user.login(with: "pass000")

user.login(with: "pas0013")

user.login(with: "ssap321")

user.unlockAccount()


//타입캐스팅 - 변수나 객체의 타입을 다른 타입으로 변환하는 프로세스
//is - 타입을 체크하는 연산자, 비교결과를 bool타입으로 반환
let char: Character = "A"

print(char is Character)
print(char is String)

let bool: Bool = true

print(bool is Bool)
print(bool is String)

//인스턴스의 타입을 확인 하거나, 해당 인스턴스를 슈퍼클래스나 하위클래스로 취급하는 방법
//as
//컴파일 단계에서 캐스팅이 실행된다. 실패할 경우 에러가 발생한다. 캐스팅하려는 타입이 같은 타입이거나 슈퍼클래스 타입이라는 것을 알 때 사용한다.
//as?
//런타임에 캐스팅이 실행ㄴ된다. 성공하면 옵셔널 타입의 인스턴스를 반환하고 실패하면 nil을 반환한다. 실패할 가능성이 있으면 as?사용하는게 좋다.
//as!
//런타임에 특정 타입으로 강제 캐스팅한다. 강제 캐스팅에 실패할 경우 런타임 에러가 발생할 수 있다. 캐스팅에 성공한 경우 인스턴스를 반환한다.(옵셔널x)

class Person{
    var id = 0
    var name = "Kim"
    var email = "kkk@kkk.com"
}

class Worker: Person{
//    var id = 0
//    var name = "Kim"
//    var email = "kkk@kkk.com"
    var salary = 300
}

class Programmer: Worker{
//    var id = 0
//    var name = "Kim"
//    var email = "kkk@kkk.com"
//    var salary = 300
    var lang = "Swift"
}
// 업캐스팅 - as
let person1 = Person()
let worker1 = Worker()
let programmer1 = Programmer()

let personList = [person1,worker1,programmer1] // 타입을 선언하지 않았지만 person 타입으로 인식 -> 즉 업캐스팅이 되있음
personList[1].name
//personList[1].salary -> Person타입으로 보고있어서 접근 불가

let worker2 = Worker()
worker2.salary

let workerPerson = worker2 as Person
//workerPerson.salary -> Person타입으로 보고있어서 접근 불가


// 다운캐스팅 - as? / as!
// as?
let pro = programmer1 as? Programmer

if let person2 = programmer1 as? Programmer{
    person2.lang
}
if let person3 = worker1 as? Programmer{
    person3.lang
}
// as!
//let pro2 = worker2 as! Programmer



//접근제한자
/*
 다른 소스 파일이나 모듈의 코드에서 코드 일부에 대한 접근을 제한한다.
 open < public < internal < fileprivate < private[제약이 많음]
 open : 모든 소스 파일에서 해당 level 접근 가능 + 모든 곳에서 서브클래싱 가능
 public : 모든 소스 파일에서 해당 level 접근 가능 + 같은 모듈 내에서만 서브클래싱 가능
 internal : 같은 모듈 내에서만 접근 가능
 fileprivate : 같은 소스파일 내에서만 접근 가능
 private : 클래스 내부에서만 접근 가능
 접근 제한자를 작성하지 않으면 internal로 판단한다.
*/

open class Vehicle{
    open func startEngine(){
        print("Engine~~")
    }
}
open class Car: Vehicle{
    open var carType: String = "Sedan"
}

//public struct Point{
//    public var x: Int
//    public var y: Int
//    
//    public init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
//    
//    public mutating func moveByX(_ deltaX: Int, y deltaY: Int){
//        self.x += deltaX
//        self.y += deltaY
//    }
//}

internal class InternalClass{
    internal var internalProperty: Int = 10
}

class OuterClass {
    fileprivate var outerVariable = 30
    
    fileprivate func outerFunction() {
        print("called")
    }
}

class MyClass {
    private var privateVariable = 40
}


struct Point{
    var x = 0.0
    var y = 0.0
    
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

var point = Point(x: 1.9, y: 4.3)
print("x = \(point.x) y = \(point.y)")

point.moveBy(x: 2.3, y: 2.1)
print("x = \(point.x) y = \(point.y)")


enum TrafficLight {
    case red, blue, green
    
    mutating func next(){
        switch self {
        case .red:
            self = .green
        case .blue:
            self = .blue
        case .green:
            self = .red
        }
    }
}

var currentLight = TrafficLight.red
print("light \(currentLight)")

currentLight.next()
print("light \(currentLight)")


//클로저

func makeIncrementer(forIncrement amount: Int) -> () -> Int{
    var total = 0
    
    //클로저반환
    let increment: () -> Int = {
        total += amount
        return total
    }
    return increment
}
