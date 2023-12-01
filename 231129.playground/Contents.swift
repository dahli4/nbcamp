import UIKit

//큐 - 먼저 들어온게 먼저 나간다

struct Queue<T>{ //T는 제네릭 하나의 타입으로 국한되지 않고 타입에 유연하게 코드를 작성할 수 있는 기능
    private var queue: [T] = []
    
    public var count: Int{
        return queue.count
    }
    
    public var isEmpty: Bool{
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T){
        queue.append(element)
    }
    
    public mutating func dequeue() -> T?{
        return isEmpty ? nil : queue.removeFirst()
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(20)
queue.dequeue()


//스택 - 먼저 들어온 값을 가장 마지막에 내보낸다

struct Stack<T>{
    private var stack: [T] = []
    
    public var count: Int{
        return stack.count
    }
    public var isEmpty: Bool{
        return stack.isEmpty
    }
    public mutating func push(_ element: T){
        stack.append(element)
    }
    
    public mutating func pop() -> T?{
        return isEmpty ? nil : stack.popLast()
    }
}

var stack = Stack<Int>()
stack.push(10)
stack.push(20)
stack.pop()


//배열 생성하기
// 타입 추론으로 생성하기
var array1 = [1,2,3] // 타입 추론으론 빈 배열 생성 불가

// 타입 어노테이션으로 생성하기
var array2: [Int] = [1,2,3]
var array3: [Int] = [] // 빈 배열 생성하기

// 생성자로 ㅅ애성하기
var array4 = Array<Int>()
var array5 = [Int]()
var array6 = [Int](repeating: 0, count: 10) // 생성과 동시에 10개 Element생성 및 0으로 초기화

// 배열 갯수 확인하기
let count: Int = array1.count
let isEmpty: Bool = array1.isEmpty

//배열 요소 추가
//1.append : 끝에 추가
array1.append(4)
array1.append(contentsOf: [5,6,7])

//2.insert : 중간에 추가
array2.insert(0, at: 0)
array2.insert(contentsOf: [10, 100], at: 1)
// 배열에 요소 변경하기
// replaceSubrange로 바꾸기 (범위 변경 시)
array2.replaceSubrange(0...2, with: [10,20,30])

// 배열 요소 삭제하기
// remove

array1.remove(at: 2)
array1.removeFirst(2) // 처음부터 2개를 제거
array1.popLast()      // 뒤에꺼 제거
array1.removeAll()

// 특정 범위 삭제하기
array2.removeSubrange(1...3)  // 1~3 제거
array2[0..<2] = []


// 배열 정렬하기
var array7 = [1,5,3,7,6,96,43]

// sort : 배열을 직접 "오름차순"으로 정렬
array7.sort()

// sort + 클로저 : 배열을 직접 "내림차순"으로 정렬
array7.sort(by: >)

// sorted : 원본은 그대로 두고, "오름차순"으로 정렬된 새로운 배열을 만들어 리턴
let sortedArray = array7.sorted()

// sorted + 클로저 : 원본은 그대로 두고, "내림차순"으로 정렬된 새로운 배열을 만들어 리턴
let sortedArray2 = array7.sorted(by: >)


// Set
/*
 Set는 집합을 생각하면 된다
 Set는 순서를 정의하지 않고 동일한 타입의 값을 저장
 항목의 순서가 중요하지 않거나 항목이 한 번만 표시되도록 해야 하는 경우 배열 대신 집합을 사용할 수 있다.\]
 세트 안에 있는 모든 값은 고유해야하므로 중복을 허용하지 않음
 */
var letters = Set<String>()
letters.insert("Classical Music")

letters = [] //초기화

var favoriteGenres: Set<String> = ["Rock", "Jazz", "Classical"]

favoriteGenres.isEmpty
favoriteGenres.count
favoriteGenres.contains("Rock") // 포함되어 있는지?
favoriteGenres.randomElement()


// 추상화 - 이렇게 타입을 정의하는 것
/*
class Account {}
struct Account {}
protocol Account {}
*/

// 캡슐화
class person {
    private var location = "서울"
    
    private func doSomething1() {
        print("휴게소 들려서 딴짓")
    }
    private func doSomething2() {
        print("한숨 자다 가기")
    }
    
    func currentLocation() {
        print("====")
        print("현재 위치: \(location)")
        print("====")
    }
    
    func goToBusan() {
        print("렛츠 서울")
        doSomething1()
        doSomething2()
        print("나우 부산")
        location = "부산"
    }
}

// 상속
class Animal {
    var species = "동물"
}

class Dog: Animal{
    var name = "초코"
}

let dog = Dog()
dog.name
dog.species


// 다형성
class Dog2{
    func bark() { print("멍멍") }
}
class Poddle: Dog2{
    override func bark() {
        print("왈왈")
    }
}

class Husky: Dog2{
    override func bark() {
        print("으르르")
    }
}
class Bulldog: Dog2{
    override func bark() {
        super.bark()
        print("bow wow")
    }
}
var dog2: Dog2 = Dog2()
dog2.bark()

dog2 = Poddle()
dog2.bark()

dog2 = Husky()
dog2.bark()

dog2 = Bulldog()
dog2.bark()


// 클래스
// 참조 타입인 클래스
class Person1{
    var name: String
    init(name: String) {
        self.name = name
    }
}

var person1 = Person1(name: "Alice")
var person2 = person1 // 참조 복사
person2.name = "Bob"

print(person1.name)
print(person2.name)

// 점을 찍으면 내부에 있는 프로퍼티나 함수에 접근을 할 수 있다
class Person2{
    var name: String
    var introduction: String { // 계산. 프로퍼티
        return "제 이름은 \(name)"
    }
    init(name: String) {
        self.name = name
    }
}

let person3 = Person2(name: "Alice")
print(person3.introduction)

class Counter{
    var count = 0 // 저장 프로퍼티
    
    func increment() {
        count += 1
    }
    
    func reset() { // 타입 메서드
        count = 0
        print("reset")
    }
}

let counter1 = Counter()
let counter2 = Counter()
counter1.increment()
counter1.increment()
print(counter1.count)

counter2.reset()
/*
static을 메서드 앞에 붙이게 되면
인스턴스 생성 없이 호출이 가능하고
static 없는 메서드는
인스턴스를 만들어서 호출해야 한다
*/
