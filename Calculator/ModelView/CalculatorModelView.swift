//
//  CalculatorModelView.swift
//  Calculator
//
//  Created by Jem Alvarez on 8/8/20.
//  Copyright © 2020 Jem Alvarez. All rights reserved.
//

import Foundation

class CalculatorModelView: ObservableObject {
    @Published var currentNum: String = "0"
    @Published var signToHighlight: String = ""
    
    var result: Double = 0
    var num1: Double = 0
    var num2: Double = 0
    var resetCurrentNum: Bool = true
    var firstCalc: Bool = true
    var sign: String = ""
    
    func reset() {
        num1 = 0
        num2 = 0
        result = 0
        resetCurrentNum = true
        firstCalc = true
        currentNum = "0"
        sign = ""
        signToHighlight = ""
    }
    
    func getCurrentNum(num: String) {
        if currentNum.count > 8 {
            return
        }
        
        if resetCurrentNum {
            currentNum = ""
            resetCurrentNum = false
        }
        
        if num == "10" {
            currentNum += "."
        } else  {
            currentNum += num
        }

        signToHighlight = ""
    }
    
    func getSign(sign: String) {
        resetCurrentNum = true
        
        if sign != "=" {
            signToHighlight = sign
            
            if self.sign == "" {
                self.sign = sign
            }
            
        } else {
            signToHighlight = ""
        }
        
        if num1 == 0 {
            num1 = Double(currentNum)!
        } else if num2 == 0 {
            num2 = Double(currentNum)!
        }
        
        if firstCalc {
            firstCalc = false
            return
        }
        
        calculate()
        
        if sign == "=" {
            let temp = result
            reset()
            currentNum = temp.removeZerosFromEnd()
        } else {
            self.sign = sign
        }
    }
    
    func calculate() {
        if sign == "+" {
            result = num1 + num2
        } else if sign == "-" {
            result = num1 - num2
        } else if sign == "÷" {
            result = num1 / num2
        } else if sign == "x" {
            result = num1 * num2
        }
        
        currentNum = result.removeZerosFromEnd()
        num1 = result
        num2 = 0
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
