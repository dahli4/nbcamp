import UIKit
//
//let color = "green"
//
//switch color{
//case "blue":
//    print("blue")
//case "green":
//    print("green")
//case "yello":
//    print("yello")
//default:
//    print("not")
//}
//
//let temperature = 30
//
//switch temperature{
//case -20...9:
//    print("cold")
//case 10...20:
//    print("warm")
//default:
//    print("hot")
//}
//
//for i in 1...4{
//    print(i)
//}
//
//let array = [1,2,3,4,5]
//
//for i in array{
//    print(i)
//}
//
//var n = [6,2,7,4,3,4]
//
//
//
//var str = [String]()
//for i in 0...n.count-1{
//    str.append(String(n[n.count-1-i]))
//}

//for chars in "ThisString"{
//    print(chars,terminator: " ")
//}

//var name: String?
//
//var optionalName: String? = "Gunter"
var number: Int? = 3
print(number)
print(number!)

if let result = number{
    print(result)
} else{
    
}

func test(){
    let number: Int? = 6
    guard let result = number else{return}
    print(result)
}
test()

let value: Int? = 6
if value == 6{
    print("ok")
}else{
    print("no")
}

let string = "12"
var stringToInt: Int! = Int(string)
print(stringToInt + 1)
