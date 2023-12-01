import UIKit

class Calculator{
    var result: Double = 0.0
    var history: [Double] = []
    func oper(_ operation: (Double, Double) -> Double, _ num1: Double, _ num2: Double) -> Double {
        result = operation(num1, num2)
        history.append(result)
        return result
    }
}

class AddOperation{
    func add(_ num1:Double, _ num2:Double) -> Double{
        return num1+num2
    }
}

class SubtractOperation{
    func subtract(_ num1:Double, _ num2:Double) -> Double{
        return num1-num2
    }
}

class MultiplyOperation{
    func multiply(_ num1:Double, _ num2:Double) -> Double{
        return num1*num2
    }
}
class DivideOperation{
    func divide(_ num1:Double, _ num2:Double) -> Double{
        if num2 != 0{
            return num1/num2
            
        }
        else{
            return 0
        }
    }
}
var cal = Calculator()
var add = AddOperation()
var sub = SubtractOperation()
var mul = MultiplyOperation()
var div = DivideOperation()

var addResult = cal.oper(add.add, 30, 403)
var subResult = cal.oper(sub.subtract, 40, 10)
var mulResult = cal.oper(mul.multiply, -20, -7)
var divResult = cal.oper(div.divide, 99, 9)
var history = cal.history

print("덧셈: \(addResult)")
print("뺄셈: \(subResult)")
print("곱셈: \(mulResult)")
print("나눗셈: \(divResult)")
print(history)
