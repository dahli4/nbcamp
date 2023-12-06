import UIKit

func makeIncrementer(forIncrement amount: Int) -> () -> Int{
    var total = 0
    
    //closure return
    let incrementer: () -> Int = {
        total += amount
        return total
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())

//참조 캡쳐
class SimpleClass{
    var value: Int = 10
}

func createClosure() -> (()-> Int){
    let instance = SimpleClass()
    
    //참조 캡쳐를 사용해 SimpleClass의 인스턴스를 캡쳐
    let closure: () -> Int = {
        //클로저가 참조하는 인스턴스의 속성을 업데이트
        instance.value *= 2
        return instance.value
    }
    
    return closure
}
//클로저 생성
let myClosure = createClosure()

print(myClosure())
print(myClosure())
//클로저 내부에서 참조된 인스턴스의 속성을 변경하였으므로 원본에도 영향을 준다

/*
{ (parameters) -> return type in
    //code
}

 함수와 클로저 비교
func pay(user: String, amount: Int){
    //code
}
let payment = {(user: String, amount: Int) in
    //code
}
*/
print("-------------------------")
func func1(_ param: String) -> String{
    return param + "!"
}

func func2(name: String) -> String{
    return name + "***"
}
//함수를 변수에 할당가능
var a: (String) -> String = func1

a("안녕")

a = func2(name:)

a("hello")

//함수를 변수에 할당해서
let closure1 = {(param: String) -> String in    //클로저 리터럴
    return param + "!"
}
closure1("Steve")


//1)

func closureFunc2(closure: () -> ()){
    print("start")
    closure()
}

//파라미터로 사용할 함수/클로저 정의
func doneFunc(){
    print("end")
}
let doneClosure = { () -> () in
    print("end")
}

closureFunc2(closure: doneFunc)
closureFunc2(closure: doneClosure)

//함수를 실행할때 클로저 형태로 전달
closureFunc2(closure: { () -> () in
    print("end")
})

func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void){
    let c = a + b
    closure(c)
}
closureCaseFunction(a: 1, b: 2, closure: {(n) in    //사후적 정의
    print("plus: \(n)")
})

closureCaseFunction(a: 1, b: 2) {(number) in
    print(number)
}

print("-------------------------")
//파라미터 생략 등 간소화 문법
func performClosure(param: (String) -> Int){
    param("Swift")
}
//타입 추론
performClosure(param: {(str: String) in
    return str.count
})
performClosure(param: {str in
    return str.count
})
//한줄인 경우 리턴 생략 가능
performClosure(param: {str in
    str.count
})
//아규먼트 이름을 축약
performClosure(param: {
    $0.count
})
// 트레일링 클로저
performClosure() {
    $0.count
}
performClosure{ $0.count }


let closureType1 = { (param) in
    return param % 2 == 0
}

let closureType2 = {$0 % 2 == 0}

let closureType3 = {(a: Int, b: Int) -> Int in
    return a*b
}

let closureType4: (Int, Int) -> Int = {(a, b) in
    return a*b
}

let closureType5: (Int, Int) -> Int = {$0 * $1}

//탈출 클로저
func sequentialExecutionExample(){
    print("start")
    
    for i in 1...3{
        print("Task \(i)")
    }
    print("Next")
    
    let result = 5 + 3
    print("result: \(result)")
    
    print("end")
}
sequentialExecutionExample()

print("-------------------------")
func asynchronousExecuionExample(){
    print("start")
    
    DispatchQueue.global().async{
        for i in 1...3{
            print(i)
        }
    }
    print("next")
    
    DispatchQueue.global().async{
        let result = 5 + 3
        print(result)
    }
    print("end")
}
asynchronousExecuionExample()
print("-------------------------")
//이스케이핑 클로저
//외부 변수 저장
var defaultFunction: () -> () = { print("print") }
func escapingFunc(closure: @escaping () -> ()){
    defaultFunction = closure
}
//GCD비동기코드
func asyncEscaping(closure: @escaping (String) -> ()){
    var name = "name"
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
        closure(name)
    }
}

asyncEscaping{ str in
    print(str)
}

//고차함수
//map 함수
let num = ["1","2","3","4","5"]
var numberArray: [Int] = []
for index in num{
    if let changeToInt = Int(index){
        numberArray.append(changeToInt)
    }
}
print(numberArray)

let StringArray = ["1","2","3","4","5"]
numberArray = StringArray.map{
    if let changeToInt = Int($0){
        return changeToInt
    }
    return 0
}
print("-------------------------")
//filter

let numbers = [1,2,3,4,5,6,7,8,9]
var evenNumbers: [Int] = []

for number in numbers {
    if number % 2 == 0{
        evenNumbers.append(number)
    }
}
print(evenNumbers)

let numbers1 = [1,2,3,4,5,6,7,8,9]
let evenNumbers2 = numbers1.filter{$0 % 2 == 0}
print(evenNumbers2)
print("-------------------------")
//reduce
let numbers2 = [1,2,3,4,5,6,7,8,9,10]
var sum = 0

for number in numbers2{
    sum += number
}
print(sum)

let numbers3 = [1,2,3,4,5,6,7,8,9,10]
let sum1 = numbers3.reduce(0, +)

print(sum1)

let numbers4 = [1,2,3,4,5,6,7,8,9,10]
let sum2 = numbers4.reduce(0){$0 + $1}

print(sum2)

print("-------------------------")
//예외처리
//Error
enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
////throw, do-catch, try
//func canThrowErrors() throws -> String
//func cannotThrowErrors() -> String

enum CustomError: Error {
    case outOfBounds
    case invalidInput(String)
}

func processValue(_ value: Int) throws -> Int {
    if value < 0{
        throw CustomError.invalidInput("cannot")
    } else if value > 100 {
        throw CustomError.outOfBounds
    }
    return value * 2
}

do {
    let result = try processValue(50)
    print(result)
} catch CustomError.outOfBounds{
    print("bounds")
} catch CustomError.invalidInput(let errorMessage){
    print(errorMessage)
} catch {
    print(error)
}
