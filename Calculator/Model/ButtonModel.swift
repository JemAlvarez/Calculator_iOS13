//
//  ButtonModel.swift
//  Calculator
//
//  Created by Jem Alvarez on 8/5/20.
//  Copyright © 2020 Jem Alvarez. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonModel {
    let backgroundColorString: String?
    let number: Int?
    let function: String?
    let sign: String?
    
    var backgroundColor: Color {
        if backgroundColorString != nil {
            switch backgroundColorString {
            case "Red":
                return Color("Red")
            case "Orange":
                return Color("Orange")
            case "Green":
                return Color("Green")
            default:
                return Color("Default")
            }
        } else {
            return Color("Default")
        }
    }
    
    var foregroundColor: Color {
        if backgroundColorString != nil {
            switch backgroundColorString {
            case "Red":
                return Color("Red")
            case "Orange":
                return Color.white
            case "Green":
                return Color.white
            default:
                return Color.black
            }
        } else {
            return Color("Default")
        }
    }
}
