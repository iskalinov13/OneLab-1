//
//  CalculatorModel.swift
//  SnapKit Practice - 3
//
//  Created by Farukh Iskalinov on 29.06.20.
//  Copyright © 2020 Farukh Iskalinov. All rights reserved.
//

import Foundation

enum OperationType {
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
    case clear
}
// Можно было бы не создавать BinaryOperation (нет как таковой необхадимости в нем), а вписать реализацию при создании как-то так
// var operations: Dictionary<String, Operation> = [
//     "^": Operation.binaryOperation({ (first, second) -> Double in
//         return pow(first, second)
//     })
// ]
struct Operation {
    var firstOperand: Double
    var symbol: String
    var operation: (Double, Double) -> Double
    func performOperationWith(_ secondOperand: Double) -> Double {
        return operation(firstOperand, secondOperand)
    }
}

struct CalculatorModel {
    var operations: Dictionary<String, OperationType> = [
        
        "√": OperationType.unaryOperation(sqrt),
        "^": OperationType.binaryOperation({ (first, second) -> Double in
            return pow(first, second)
        }),
        "+": OperationType.binaryOperation({ (first, second) -> Double in
            return first + second
        }),
        "÷": OperationType.binaryOperation({ (first, second) -> Double in
            return first / second
        }),
        "×": OperationType.binaryOperation({ (first, second) -> Double in
            return first * second
        }),
        "-": OperationType.binaryOperation({ (first, second) -> Double in
            return first - second
        }),
        "=": OperationType.equals,
        "AC": OperationType.clear
        
    ]
    
    private var globalValue: Double?
    private var saving: Operation?
    private var history: [String] = [String]()
    
    mutating func setOperand(_ operand: Double){
        globalValue = operand
    }
    mutating func performOperation(_ operation: String) {
        let symbol = operations[operation]!
        switch symbol {
        case .unaryOperation(let function):
            let currentValue = globalValue
            globalValue = function(globalValue!)
            history.append("\(operation) \(currentValue!) = \(globalValue!)")
        case .binaryOperation(let function):
            saving = Operation(firstOperand: globalValue!, symbol: operation, operation: function)
        case .equals:
            if saving != nil {
                let secondOperand = globalValue!
                let firstOperand = saving!.firstOperand
                let symbol = saving!.symbol
                globalValue = saving?.performOperationWith(globalValue!)
                history.append("\( firstOperand) \(symbol) \(secondOperand) = \(globalValue!)")
                saving = nil
            }
        case .clear:
            globalValue = 0.0
        }
    }
    func getResult() -> Double? {
        return globalValue!
    }
    
    func getHistory() -> [String] {
        return history
    }
}
// Просто Operation. Знаю что есть enum Operation (можно было назвать OperationType)
// SaveFirstOperandAndOperation можно назвать переменную
// И таким образом ты мог бы хранить историю не в string а более явное + с naming-ом не было бы проблем

