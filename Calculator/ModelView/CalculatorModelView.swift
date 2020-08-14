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
    @Published var shouldErase: Bool = true
    
    var result: Double = 0
    var num1: Double = 0
    var num2: Double = 0
    var sign: String = ""
    var resetCurrentNum: Bool = true
    var firstCalc: Bool = true
    var canType: Bool {
        if currentNum.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "").count >= 9 && !resetCurrentNum {
            return false
        }
        
        return true
    }
    
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
    
    func erase() {
        if currentNum.count > 1 && !resetCurrentNum && shouldErase {
            currentNum = formatNumber(from: String(currentNum.dropLast()))
        }
    }
    
    func formatNumber(from str: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let rawNum = numberFormatter.number(from: str.replacingOccurrences(of: ",", with: ""))
        let formattedString = numberFormatter.string(from: rawNum!)
        return formattedString!
    }
    
    func getCurrentNum(num: String) {
        if !canType {
            return
        }
        
        if resetCurrentNum {
            currentNum = ""
            resetCurrentNum = false
        }
        
        if num == "10" {
            if !currentNum.contains(".") {
                if currentNum == "" {
                    currentNum += "0."
                } else {
                    currentNum += "."
                }
            }
        } else {
            currentNum += num
            
            if !currentNum.contains(".") {
                currentNum = formatNumber(from: currentNum)
            }
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
            num1 = Double(currentNum.replacingOccurrences(of: ",", with: ""))!
        } else if num2 == 0 {
            num2 = Double(currentNum.replacingOccurrences(of: ",", with: ""))!
        }
        
        if firstCalc {
            firstCalc = false
            return
        }
        
        calculate()
        
        if sign == "=" {
            let tempResult = result
            
            reset()
            
            if "\(tempResult)".contains("e-"){
                let numberString = "\(tempResult)"
                let firstNumber = numberString[numberString.startIndex]
                let exponent = numberString[(numberString.firstIndex(of: Character("e")) ?? numberString.startIndex)..<numberString.endIndex]
                currentNum = "\(firstNumber)\(exponent)"
            } else {
                let tempFormatted = formatNumber(from: tempResult.removeZerosFromEnd()).replacingOccurrences(of: ",", with: "")
                
                if tempFormatted.count > 9 {
                    currentNum = Double(tempFormatted)!.scientificFormatted
                } else {
                    currentNum = tempFormatted
                }
            }
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
        
        if "\(result)".contains("e-"){
            let numberString = "\(result)"
            let firstNumber = numberString[numberString.startIndex]
            let exponent = numberString[(numberString.firstIndex(of: Character("e")) ?? numberString.startIndex)..<numberString.endIndex]
            currentNum = "\(firstNumber)\(exponent)"
        } else {
            let finalResult = formatNumber(from: result.removeZerosFromEnd()).replacingOccurrences(of: ",", with: "")
            
            if finalResult.count > 9 {
                currentNum = Double(finalResult)!.scientificFormatted
            } else {
                currentNum = formatNumber(from: result.removeZerosFromEnd())
            }
        }
        
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

extension Formatter {
    static let scientific: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        return formatter
    }()
}

extension Numeric {
    var scientificFormatted: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}
