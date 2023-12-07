import UIKit

var n = [1,2,3,4,5]
var numberArray: [Int] = []

numberArray = n.map{$0}
numberArray.reverse()
print(numberArray)
print("----------------------------")

//프로토콜
protocol Vehicle{
    var speed: Double {get set} //get set을 모두 요구하는 가변 속성
    var manufacturer: String {get}  //읽기 전용 속성
}
class Car: Vehicle{
    var speed: Double = 0.0
    var manufacturer: String = "Toyota"
}
class Bicyle: Vehicle{
    var speed: Double = 0.0
    var manufacturer: String {return "Giant"}
}
let car = Car()
car.speed = 60.0    //set 가능
print(car.speed)    //get 가능
print(car.manufacturer) //get 가능

let bike = Bicyle()
bike.speed = 40.0
print(bike.speed)
print(bike.manufacturer)
print("----------------------------")

protocol Student{
    var studentId: Int {get set}
    var name: String {get}
    func printInfo() -> String
}
struct UnderGraduateStudent: Student{
    var studentId: Int
    var name: String
    var major: String
    
    func printInfo() -> String {
        return "\(name), \(studentId), \(major)"
    }
}
struct GraduateStudent: Student{
    var studentId: Int
    var name: String
    var degree: String
    var labNumber: Int
    
    func printInfo() -> String {
        return "\(name), \(labNumber), \(degree)"
    }
}

let underGraduate: Student = UnderGraduateStudent(studentId: 1, name: "Kim", major: "com")
let graduate: Student = GraduateStudent(studentId: 2, name: "Lee", degree: "aa", labNumber: 4)

