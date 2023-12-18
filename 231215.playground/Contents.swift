import UIKit

struct User {
    var nickname: String
    var age: Int
    
    func information(){
        print("\(nickname) \(age)")
    }
}

var user = User(nickname: "Kim", age: 27)

user.age
user.age = 28
user.age

user.information()
