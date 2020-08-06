//
//  ContentView.swift
//  Calculator
//
//  Created by Jem Alvarez on 8/5/20.
//  Copyright © 2020 Jem Alvarez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ButtonView(button: ButtonModel(backgroundColorString: nil, number: nil, function: "deg", sign: nil))
            ButtonView(button: ButtonModel(backgroundColorString: "Red", number: nil, function: nil, sign: "C"))
            ButtonView(button: ButtonModel(backgroundColorString: "Green", number: nil, function: nil, sign: "="))
            ButtonView(button: ButtonModel(backgroundColorString: "Orange", number: nil, function: nil, sign: "+"))
            ButtonView(button: ButtonModel(backgroundColorString: nil, number: 0, function: nil, sign: nil))
            ButtonView(button: ButtonModel(backgroundColorString: nil, number: 8, function: nil, sign: nil))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
