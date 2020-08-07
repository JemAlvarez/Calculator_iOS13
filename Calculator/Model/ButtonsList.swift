//
//  ButtonsList.swift
//  Calculator
//
//  Created by Jem Alvarez on 8/6/20.
//  Copyright © 2020 Jem Alvarez. All rights reserved.
//

import Foundation

struct ButtonsList {
    static let buttons = [
        [
            ButtonModel(backgroundColorString: nil, number: nil, function: "π", sign: nil),
            ButtonModel(backgroundColorString: nil, number: nil, function: "e", sign: nil),
            ButtonModel(backgroundColorString: nil, number: nil, function: "√", sign: nil),
            ButtonModel(backgroundColorString: nil, number: nil, function: "|x|", sign: nil)
        ],
        [
            ButtonModel(backgroundColorString: "Red", number: nil, function: nil, sign: "C"),
            ButtonModel(backgroundColorString: nil, number: nil, function: "+/-", sign: nil),
            ButtonModel(backgroundColorString: nil, number: nil, function: "%", sign: nil),
            ButtonModel(backgroundColorString: "Orange", number: nil, function: nil, sign: "÷")
        ],
        [
            ButtonModel(backgroundColorString: nil, number: 7, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: 8, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: 9, function: nil, sign: nil),
            ButtonModel(backgroundColorString: "Orange", number: nil, function: nil, sign: "x")
        ],
        [
            ButtonModel(backgroundColorString: nil, number: 4, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: 5, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: 6, function: nil, sign: nil),
            ButtonModel(backgroundColorString: "Orange", number: nil, function: nil, sign: "-")
        ],
        [
            ButtonModel(backgroundColorString: nil, number: 1, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: 2, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: 3, function: nil, sign: nil),
            ButtonModel(backgroundColorString: "Orange", number: nil, function: nil, sign: "+")
        ],
        [
            ButtonModel(backgroundColorString: nil, number: 0, function: nil, sign: nil),
            ButtonModel(backgroundColorString: nil, number: nil, function: nil, sign: "."),
            ButtonModel(backgroundColorString: "Green", number: nil, function: nil, sign: "=")
        ]
    ]
    
    static let lastRow = [
        ButtonModel(backgroundColorString: nil, number: 0, function: nil, sign: nil),
        ButtonModel(backgroundColorString: nil, number: nil, function: nil, sign: "."),
        ButtonModel(backgroundColorString: "Green", number: nil, function: nil, sign: "=")
    ]
}
