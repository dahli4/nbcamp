//
//  main.swift
//  eee
//
//  Created by A on 2023/12/06.
//

import Foundation
let a = readLine()!.components(separatedBy: " ")
var numberArray: [Int] = []

numberArray = a.map{
    if let change = Int(String($0)){
        return change
    }
    return 0
}
let reversearr = numberArray.reversed().map{ $0 }
numberArray.reverse()
print(numberArray)
