import UIKit

class AbstractOperation {
    func operate(_ num1: Int, _ num2: Int) -> Double? {
        return nil
    }
}
class Calculator{
    private var abstractOperation: AbstractOperation
    
    init(abstractOperation: AbstractOperation) {
        self.abstractOperation = abstractOperation
    }
    func setOperation(operation: AbstractOperation){
        self.abstractOperation = operation
    }
    func calculate(num1: Int, num2: Int) -> Double{
       abstractOperation.operate(num1, num2) ?? 0
    }
}

class AddOperation: AbstractOperation{
    override func operate(_ num1:Int, _ num2:Int) -> Double{
        return Double(num1+num2)
    }
}

class SubtractOperation: AbstractOperation{
    override func operate(_ num1:Int, _ num2:Int) -> Double{
        return Double(num1-num2)
    }
}

class MultiplyOperation: AbstractOperation{
    override func operate(_ num1:Int, _ num2:Int) -> Double{
        return Double(num1*num2)
    }
}
class DivideOperation: AbstractOperation{
    override func operate(_ num1:Int, _ num2:Int) -> Double{
        if num2 != 0{
            return Double(num1/num2)
            
        }
        else{
            return 0
        }
    }
}

let calculator = Calculator(abstractOperation: AddOperation())

let addResult = calculator.calculate(num1: 10, num2: 20)

calculator.setOperation(operation: SubtractOperation())
let subResult = calculator.calculate(num1: 40, num2: 10)

calculator.setOperation(operation: MultiplyOperation())
let mulResult = calculator.calculate(num1: 3, num2: 9)

calculator.setOperation(operation: DivideOperation())
let divResult = calculator.calculate(num1: 9, num2: 3)

print("덧셈: \(addResult)")
print("뺄셈: \(subResult)")
print("곱셈: \(mulResult)")
print("나눗셈: \(divResult)")
