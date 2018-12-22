//
//  CalculatorLogic.swift
//  iPhoneCalculator App
//
//  Created by Mustafa on 22/12/2018.
//  Copyright © 2018 Mustafa. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var mathematicalOperationCalculation: (n1: Double, symbol: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculatorLogic (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performCalculation(n2: n)
            default:
                mathematicalOperationCalculation = (n1: n, symbol: symbol)
            }
        }
        
        return nil
    }
    
    private func performCalculation(n2: Double) -> Double? {
        
        if let n1 = mathematicalOperationCalculation?.n1 ,
            let operation = mathematicalOperationCalculation?.symbol {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1/n2
            case "x":
                return n1 * n2
            default:
                print("asdasd")
            }
        }
        
        return nil
        
        
    }
    
}
