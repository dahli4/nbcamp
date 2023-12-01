import UIKit

// 구조체 Struct
struct Point{
    var x: Int
    var y: Int
}

var point1 = Point(x: 10, y: 19)
var point2 = point1     // 값 복사
point2.x = 30

print(point1)
print(point2)


struct Coffee{
    var name: String?
    var size: String?
    
    func brewCoffee() -> String{
        if let name = self.name{
            return "\(name)"
        }else{
            return "today coffee"
        }
    }
}
let americano =  Coffee(name: "아메리카노")

// 따로 init()을 구현하지 않아도 자동으로 생성자를 받는다
// Memberwise Initializer 예시
struct ShoppingListItem {
    let name: String?
    let quantity: Int
    var purchased = false
}

let item1 = ShoppingListItem(name: "칫솔", quantity: 1)
let item2 = ShoppingListItem(name: "치약", quantity: 1, purchased: true)
let item3 = ShoppingListItem(name: nil, quantity: 1, purchased: true)


// 열거형 Enum

enum CompassDirection{
    case north
    case south
    case east
    case west
}

var direction = CompassDirection.north
var anotherdirection = direction    // 값 복사

direction = .east       // 값을 변경해도 anotherDirection에는 영향이 없음

print(direction)
print(anotherdirection)



enum Trade{
    case buy(stock: String, amount: Int)
    case sell(stock: String, amount: Int)
    case hold
}

let trade1 = Trade.buy(stock: "AAPL", amount: 100)
let trade2 = Trade.sell(stock: "GOOG", amount: 50)
let trade3 = Trade.hold

func processTrade(trade: Trade){
    switch trade{
    case .buy(let stock, let amount):
        print("Buy \(amount) shares of \(stock)")
    case .sell(let stock, let amount):
        print("Sell \(amount) shares of \(stock)")
    case .hold:
        print("Hold")
    }
}


// allCases
enum Beverage: CaseIterable{
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices)")


// 붕어빵을 만드는 기계를 클래스, 붕어빵을 그 기계로 만ㄷㄹ어진 실제 객체로 비유할 수 있음.
